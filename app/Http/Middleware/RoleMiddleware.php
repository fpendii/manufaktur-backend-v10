<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, ...$roles): Response
    {
        // Periksa apakah pengguna sudah login
        if (!Auth::check()) {
            return response()->json(['message' => 'Unauthorized.'], 401);
        }

        $user = Auth::user();

        // Periksa apakah role pengguna ada di daftar role yang diizinkan
        if (!in_array($user->role, $roles)) {
            return response()->json(['message' => 'Forbidden. You do not have the right access.'], 403);
        }

        return $next($request);
    }
}
