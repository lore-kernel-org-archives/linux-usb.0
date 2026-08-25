Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4E538F938;
	Tue, 25 Aug 2026 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787657374; cv=none; b=GYFTNE4OZkHzPzAyKOnpyziXpvc6YQHjpNhRHJb59pzrwZ30tVz0X3TsGX9B8a5+6WrHAglyD+kuGMjmAqy7IwvnWJc+Ndoi4dHmsxGZNMnMmyQzqRK2SfgjSHsQb81UbjuoF6On1SiXiFkuaRdY8Usu5EvNbklVLO0i3JWR18k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787657374; c=relaxed/simple;
	bh=ccocoJo7X2WLUZPkZftVJBl56ZPJ4K0PqwIZB/iLZm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQg19C6xMHF5vhwq43JL+zUMaCSvWCdvYGZ9Rw8X2Eng65rBHwP0I5wL79i5kdnMQI0J+IgLhIfjOQjtIpPdReb9zFGh5LtMtxEkfl/Hwl/cCoXVF+nnSDHHpWBrRh3NiNsnCRQWsBzPB60vwhDDtm1xYDJ0vZwO93dU6+g9zkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnz19v03; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnz19v03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787657371; x=1819193371;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ccocoJo7X2WLUZPkZftVJBl56ZPJ4K0PqwIZB/iLZm8=;
  b=fnz19v03E1QFVQKmtGMQ14ZpI2MM3Fc5OQnFQt2VYv8c8LGnA7WB3Urk
   anRFinuvNHGBlqXlFTQuCQNquW93CzXDy+Er0UBvoqCFOqafIsTw1/fVm
   GXLbs8cnXSph1CL+I7wRWoP8XnZi5mknixfQe1a6v3GpfDMMmoNb+J6IL
   eyaG6OpkJavATZDciOLk9JLfk00Nf2W65AWIppG/+4Adt63eTmsfLObmH
   DdTW0sr9NgDFn9AUI79vPeEv5psxMigSJ48GdEwL83RDHgEq+8WC6AA99
   /ZoCBtYUhPZHx9eNN0/lqkscDHVzP+ted1SPiUEtItbJJmepr/izGVF9G
   g==;
X-CSE-ConnectionGUID: m4ptcBkvRDW3Uz670N3Sfg==
X-CSE-MsgGUID: 3cMihiUxTkarkyF+hQar5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88042335"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="88042335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 04:29:31 -0700
X-CSE-ConnectionGUID: 66Tqw21HRkyNb6kjpmzZig==
X-CSE-MsgGUID: fb6JKisdQPSGBiIsIlPjEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="261134812"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.83]) ([10.245.245.83])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 04:29:29 -0700
Message-ID: <3d38c703-8d10-4017-812a-cf6b335ef496@linux.intel.com>
Date: Tue, 25 Aug 2026 14:29:22 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Fix lockdep warning when entering test mode
To: Yang Zi <2959243019@qq.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_0F874E79839C91CD14A58265BF7B6D89850A@qq.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <tencent_0F874E79839C91CD14A58265BF7B6D89850A@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/25/26 12:09, Yang Zi wrote:
> xhci_enter_test_mode() and xhci_set_port_power() are annotated
> __must_hold(&xhci->lock), yet both drop the lock in the middle of the
> function: xhci_enter_test_mode() around the slot-disable loop (because
> xhci_disable_and_free_slot() takes the lock itself and can sleep) and
> xhci_set_port_power() around the ACPI power-state calls.
> 
> xhci->lock is also taken from hardirq context in xhci_irq(), so it is a
> hardirq-safe lock.  Dropping it with spin_unlock_irqrestore() re-enables
> interrupts while the lock is still held, and lockdep's
> trace_hardirqs_on() -> mark_held_locks() then records the lock as
> HARDIRQ-ON-W, which conflicts with the IN-HARDIRQ-W usage registered by
> xhci_irq():
> 
>      inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
> 

This sounds odd, shouldn't spin_unlock_irqresore() first release the
spinlock and then enable interrupts?

Wouldn't this be an issue for every driver that shares a spinlock
in interrupt context and elsewhere?

spinlock_api_smp.h has:

static inline void __raw_spin_unlock_irqrestore(raw_spinlock_t *lock,
unsigned long flags)
	__releases(lock)
{
         spin_release(&lock->dep_map, _RET_IP_);
         do_raw_spin_unlock(lock);
	local_irq_restore(flags);
         preempt_enable();
}


To be fair it looks odd on a uniprocessor system:

spinlock_api_up.h:

#define __UNLOCK_IRQRESTORE(lock, flags, ...) \
   do { local_irq_restore(flags); __UNLOCK(lock, ##__VA_ARGS__); } while (0)

Are you running this on a single processor system?

> Fix this by releasing the lock *before* re-enabling interrupts (and, on
> the way back, disabling interrupts before re-acquiring the lock), so the
> hardirq-safe lock is never held with IRQs enabled.  Also drop the
> incorrect __must_hold() annotations and pass the saved IRQ state by
> value so these helpers cannot clobber the caller's flags.
> 
> This patch is tentative and needs maintainer review.
> 
> Signed-off-by: Yang Zi <2959243019@qq.com>
> ---
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index b0264bd8577a..c28d278f45b0 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -638,12 +638,19 @@ struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
>   
>   /*
>    * xhci_set_port_power() must be called with xhci->lock held.
> - * It will release and re-acquire the lock while calling ACPI
> - * method.
> + * It drops the lock while calling the ACPI method, which may sleep, and
> + * re-acquires it before returning.
> + *
> + * The lock is released *before* interrupts are re-enabled because
> + * xhci->lock is also taken in hardirq context (xhci_irq()) and must never
> + * be held with IRQs enabled.
> + *
> + * @flags is passed by value: it is the IRQ state saved by the caller's
> + * spin_lock_irqsave() and must not be clobbered by the lock/irqsave dance
> + * below, so the caller can later restore it with spin_unlock_irqrestore().

The caller should restore it to the flags value set during latest spin_lock_irqsave()
which is during the lock/irqsace dance.

Thanks
Mathias

