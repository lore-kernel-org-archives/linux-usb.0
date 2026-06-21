Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BEC366564
	for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782047321; cv=none; b=mVZziW2jpV/2d52yg57z7EF+YYmG/f6h8ah4mTNBa0Ef8UWmD2jl2dciTn1vJ6zu+6oZ3hiZkEcegH2xiinbuU2k1Td8sN7rPFXBkJZVyIG7+Q+Es3d5WQGB0KLg6rixQADYbjTCAhvbxa2IRZm5pJz8V3VvpxAl9y9Rl8xWCN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782047321; c=relaxed/simple;
	bh=me33Az45dCRutFUzQ4N1c3MdvdJrDzsOWQ4IrxhWNMc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inW2NpU8E8Vxgc5lFHk95O9kbtU4Cunupt+tFcubusS33kJnw7nDZAbozJi+BR3F/pje+GgbS8X8Cu2mnEI2k82Xq0BUt3qTc3tbCamlL+FzgOGSwQ3+FsLKFJ7o8APjP+gZ0ZqVh2G05XjXfb9gJ2RUIqcXLrX3alQL3Bri+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfEhSIE7; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfEhSIE7"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7fdbd0960b9so28914467b3.3
        for <linux-usb@vger.kernel.org>; Sun, 21 Jun 2026 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782047318; x=1782652118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JelQF+PgdiILboeOL52+qm2l/XNW/EjjD3ktKV3cKe4=;
        b=nfEhSIE74z/mf/Z0c5mBSac7i23tgbFrZildwk1bx4AMBh+Zvd6dgn1udde+l8ZPPt
         0/2MSos+4QuEn79HqB7TNx+LupVlYAuHYCQso+l8Qu24O0nCvNIjadYhVuzQNhGZuGat
         +imEhhVfRs9k0rJXxvPzJSID5NjBzk6jzcCjfaQVfidNvLI159z3cgw76JnCvUU6svHi
         o1dWoJaO+ZxaW9xedadD57tLyWjTqjFUTrYt0Z66hkoiPVP+32DBA/zOqd5NzPx4Qo+F
         elQdARSkMiZK16gZd19EcX5w0Mu5Uesp5bySYww6zgBY9BTejYSEeYeX8mhHvewdew2h
         YP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782047318; x=1782652118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JelQF+PgdiILboeOL52+qm2l/XNW/EjjD3ktKV3cKe4=;
        b=UOTFbYJHSa03Br8zKeCGffwhxSvsdc+/zYcxR79ITe8GaymSc6n05IBBJVXEdIm9P4
         3j4i7S7nwi5oQbhBn9WptKcAz1qeolAeWW/Ym+lp0+HgnQXbgRQZqVcErIjlJJw5FPiy
         9YV1BqoE2undrlglNL+Z5CjVMEohA7SalS9Ztays3Lir4CZXNI/u7AXPGnTuoDRXi2tY
         axgHKNiH1q+vcXy24fz9Z9pWtdu7Mm2k5xe7O3k1385OmZJHXXrg1BsobGBARcQfB9QO
         2FVL0DpcUTcsHEEkd355aktL++BT0S1mwB1ucWIdxGL+KBq5qlvRBqfPisaSLbuYTFWQ
         ivww==
X-Forwarded-Encrypted: i=1; AHgh+Rq5oeqX6+LFWYn4pd2a8hFckashtb0q7FkFh4F/k4PE8oVJ0mtEJKfUpjjfWp8178SyV/9GfxCwask=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj51cQJyYC1j8pkQQ4NMQdWhngcNmHl7u5yOILdVBcSg5W0SgA
	R0f5xff7VUsWvMGWgXFemIt9GuEgPkIUsuLQQYrjFCJnzdRluBCpDexn
X-Gm-Gg: AfdE7ckzrs1jKsKRv9792S8bdDXrKx32GpmMeXboVxZzoO/jX1hqpvcR8s6g457nGba
	HU74HV8mKsZXx03Cci3t3dB3eCU8iBjEn/Sacwjg6wmOpSuTmhgc0sRHyRFaHcQcXIgY4OMxdz6
	62pXWKtQWcWeEyGeJpO20iV6Nvkw6/lWI2O8SsNM0Idyrz8ovG5K1HKsOcSu5gon5rx0fAh2s6p
	7XPXWOStVuZihzk9QpkvajPgUylnwXl41xDbMpqpT1luzP/dSYJF+2ifSP2d0VR3WHWi8wwzdcz
	N0KFOmuFU2aiZ3kc3D8VyBBATw1BERrAeAKqVlB9bmKauWJG2shEjhV6pg4tZFXhZsz1ueQZCG/
	euC5tjP5vw543a9q+N+Z9OBdQtMKj93e47F0koaIszhdgXDtkdXTtL7At/zEZTzRxw/DoXW/Lfp
	Hg80hw4VjAryzbR7JMLsUu1qccf0NjQSTP2Jw=
X-Received: by 2002:a05:690c:6881:b0:7fd:5297:28da with SMTP id 00721157ae682-80139103c73mr119142517b3.49.1782047317965;
        Sun, 21 Jun 2026 06:08:37 -0700 (PDT)
Received: from localhost (user-24-214-85-55.knology.net. [24.214.85.55])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025cf693f8sm20544597b3.15.2026.06.21.06.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:08:37 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Sun, 21 Jun 2026 09:08:37 -0400
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Yury Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] tracing: Move non-trace_printk prototypes back to
 kernel.h
Message-ID: <ajfiVTlCIVlqW3sh@yury>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.007634476@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621093811.007634476@kernel.org>

On Sun, Jun 21, 2026 at 05:34:31AM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> In order to remove the include to trace_printk.h from kernel.h the tracing
> control prototypes need to be moved back into kernel.h. That's because

Please don't. Instead, you can split them out to trace_control.h, and
include where needed. I actually have a prototype for it, FYI:

https://github.com/norov/linux/tree/trace_pritk3

> they are used in other common header files like rcu.h. There's no point in
> removing trace_printk.h from kernel.h if it just gets added back to other
> common headers.
> 
> Prototypes are very cheap for the compiler and should not be an issue.

It's not about cost, it's about mess. kernel.h is included everywhere.
Is that API needed everywhere? No, it's needed in literally 10 files.
So, no place in kernel.h.
 
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
>  include/linux/kernel.h       | 18 ++++++++++++++++++
>  include/linux/trace_printk.h | 17 -----------------
>  2 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index e5570a16cbb1..c3c68128827c 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -194,4 +194,22 @@ extern enum system_states system_state;
>  # define REBUILD_DUE_TO_DYNAMIC_FTRACE
>  #endif
>  
> +#ifdef CONFIG_TRACING
> +void tracing_on(void);
> +void tracing_off(void);
> +int tracing_is_on(void);
> +void tracing_snapshot(void);
> +void tracing_snapshot_alloc(void);
> +void tracing_start(void);
> +void tracing_stop(void);
> +#else
> +static inline void tracing_start(void) { }
> +static inline void tracing_stop(void) { }
> +static inline void tracing_on(void) { }
> +static inline void tracing_off(void) { }
> +static inline int tracing_is_on(void) { return 0; }
> +static inline void tracing_snapshot(void) { }
> +static inline void tracing_snapshot_alloc(void) { }
> +#endif
> +
>  #endif
> diff --git a/include/linux/trace_printk.h b/include/linux/trace_printk.h
> index 3d54f440dccf..879fed0805fd 100644
> --- a/include/linux/trace_printk.h
> +++ b/include/linux/trace_printk.h
> @@ -35,15 +35,6 @@ enum ftrace_dump_mode {
>  };
>  
>  #ifdef CONFIG_TRACING
> -void tracing_on(void);
> -void tracing_off(void);
> -int tracing_is_on(void);
> -void tracing_snapshot(void);
> -void tracing_snapshot_alloc(void);
> -
> -extern void tracing_start(void);
> -extern void tracing_stop(void);
> -
>  static inline __printf(1, 2)
>  void ____trace_printk_check_format(const char *fmt, ...)
>  {
> @@ -176,16 +167,8 @@ __ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);
>  
>  extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
>  #else
> -static inline void tracing_start(void) { }
> -static inline void tracing_stop(void) { }
>  static inline void trace_dump_stack(int skip) { }
>  
> -static inline void tracing_on(void) { }
> -static inline void tracing_off(void) { }
> -static inline int tracing_is_on(void) { return 0; }
> -static inline void tracing_snapshot(void) { }
> -static inline void tracing_snapshot_alloc(void) { }
> -
>  static inline __printf(1, 2)
>  int trace_printk(const char *fmt, ...)
>  {
> -- 
> 2.53.0
> 
