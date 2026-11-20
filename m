Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172033;
	b=aJFcwlgervohQdvqTkVEqKqMFnk1Kwx0qOmyALK4d6WlK9D/b02nP6S2S0nYbFQX7/t0
	 xWGw8hhBQXTWibhdhzyRgEgOszCUpAQ374d855eqm+RNl8kljmqVuLqbY5tBl+U+QFkhe
	 ZSknAIzRc6IWZ8voMra3Dq4CxuSauSiGObD4UaluhF/tdfJVR07Jnu9E2Fx7ciVR/emk6
	 mLG7xSCGR2OWT1/K8wrbIDjLkCeLxAoTUfTgCxDw7MnUqy9fUl3vIt5BN7jMrkM/sND97
	 /37WBOooITtbJ/x6JaI8P+SOe7iDGGq0p1RgofQy3p696R6mJWktm8atwaR8T1wqBTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172033;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qQVY7SK4l1ABvnSkTZSdBFfdgRUoooaAcPOoaavPmcA=;
	b=ppkJEYz6Dq9urLLzH3LhqBOLnqPh16Pl3WSqF0mojsI7ONo69B0e1RE8HSh6zqK4kx9M
	 FBWISG0v5pGhUmqSOUNwOiSLGDQ6gJBTx7BBMWZJHJFB+otYweLPyc1uHKgfNt4oJpQtS
	 IsfRXbkGSp06UWhPEtqKBuyQ0eAk/lvpiIM05Qsz80DwYsJhBuplExuB0xC0Zhy1/Fxcu
	 T5WOinS1uUnS0ymlIOdnhTGNh+RxltOFPQO32Z9Q0L7mhzMLIwZjhfX4upp0H9wUv+/oO
	 obot3XaNT805o4jGB3FHGEeTOp71YUVUBRBZFzK2QQkhwJGWBbCKOxzOZEcYhnGVFRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tu7AV10+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9234606A320;
	Fri, 20 Nov 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=tu7AV10+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8881F000D8;
	Fri, 20 Nov 2026 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795172033;
	bh=qQVY7SK4l1ABvnSkTZSdBFfdgRUoooaAcPOoaavPmcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tu7AV10+sav1r+WlWAMPMzd99o0KBYtRIhkvfX5eix4lMSn/mJ2KzKici8DmPdL/r
	 QT9XoyLvss0Kcbvq4c209uUtVhn3RDdBEkywJEcD0qtrnrVglPULEE/RUsQqCHs2I1
	 jPrsBObXKdnW0u9I8eKFarHcOtUNa9mQFz4YFM8k=
Date: Fri, 20 Nov 2026 11:53:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_tcm: detach the gadget in
 usbg_drop_tpg() to fix a use-after-free
Message-ID: <2026112038-sliceable-nail-bc82@gregkh>
References: <20260919090726.3256229-1-benquike@gmail.com>
 <20260919112820.3885842-1-benquike@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919112820.3885842-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 11:28:20AM +0000, Hui Peng wrote:
> A target portal group can be removed with rmdir() on its configfs
> directory while it is still enabled and still attached to a USB gadget
> function. usbg_drop_tpg() frees the struct usbg_tpg but never calls
> usbg_detach(), and it leaves opts->can_attach set, so the function
> instance keeps a dangling tpg pointer and a subsequent bind to a UDC
> happily attaches to freed memory.
> 
> Enumerating the gadget then dereferences the freed tpg from the UAS/BOT
> completion path, in softirq context:
> 
>  ==================================================================
>  BUG: KASAN: slab-use-after-free in usbg_submit_command.isra.0+0xbe7/0xd50
>  Read of size 8 at addr ffff888107493478 by task swapper/3/0
> 
>  CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Tainted: G    B D    7.3.0-rc3-g5dd1818b15d9 #1 PREEMPT(lazy)
>  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>  Call Trace:
>   <IRQ>
>   dump_stack_lvl+0x70/0xa0
>   print_report+0x153/0x4c6
>   kasan_report+0xf1/0x120
>   usbg_submit_command.isra.0+0xbe7/0xd50
>   uasp_cmd_complete+0x83/0xf0
>   dummy_timer+0x1337/0x2d60
>   __hrtimer_run_queues+0x2a3/0x640
>   hrtimer_run_softirq+0x1b1/0x3d0
>   handle_softirqs+0x188/0x4e0
>   __irq_exit_rcu+0x62/0x150
>   sysvec_apic_timer_interrupt+0x6b/0x80
>   </IRQ>
> 
>  Allocated by task 1:
>   __kmalloc_cache_noprof+0x16a/0x380
>   usbg_make_tpg+0x243/0x580
>   target_fabric_make_tpg+0xb1/0x7f0
>   configfs_mkdir+0x4e9/0xe10
>   vfs_mkdir+0x2ed/0x790
>   __x64_sys_mkdir+0x6f/0xa0
> 
>  Freed by task 1:
>   kfree+0x159/0x420
>   config_item_cleanup+0x148/0x1e0
>   config_item_put+0x90/0xb0
>   configfs_rmdir+0x816/0xa50
>  ==================================================================
> 
> Detach the gadget in usbg_drop_tpg() if the tpg is still connected, and
> clear opts->can_attach for every function instance bound to this tpg so
> that a later usbg_attach() cannot pick up the freed object.
> 
> The forward declarations of usbg_attach() and usbg_detach() are moved
> above usbg_drop_tpg() since it now calls usbg_detach().
> 
> Fixes: dc8c46a5ae77 ("usb: gadget: f_tcm: convert to new function interface with backward compatibility")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> v2: Add the Fixes: tag that v1 said it could not determine.
> 
> dc8c46a5ae77 introduced opts->can_attach, the !opts->can_attach gate in
> tcm_bind(), usbg_attach()/usbg_detach(), the tpg_instances[] table and
> fu->tpg, and the version of usbg_drop_tpg() that tears all of that down
> without ever detaching - i.e. every line this patch touches. Note
> git blame points at 08a1cb0f65fd ("usb: gadget: tcm: factor out
> f_tcm") for the top of usbg_drop_tpg(), but that commit is a pure file
> split out of legacy/tcm_usb_gadget.c, so it is not the tag.
> 
> There is a defensible alternative: 4bb8548df632 ("usb: gadget: f_tcm:
> add configfs support") added the callbacks that set can_attach for a
> pure-configfs gadget, which is what my reproducer uses. I went with
> dc8c46a5ae77 because the legacy gadget already set can_attach
> unconditionally, so the hole was reachable without 4bb8548df632 - and
> in any case both landed in v4.5-rc1, five patches apart in the same
> series, so the backport target is identical. Happy to switch if you
> prefer the other.
> 
> For completeness, the underlying "free the tpg without detaching"
> shape is as old as c52661d60f63 ("usb-gadget: Initial merge of target
> module for UASP + BOT", v3.5-rc1), but f_tcm.c does not exist before
> v4.5-rc1 and opts->can_attach - which this patch has to clear - did
> not either, so dc8c46a5ae77 is the oldest commit this patch is
> actually applicable to.
> 
> Two things worth a reviewer's attention: tpg->gadget_connect is read
> here without the target-core configfs locking that usbg_enable_tpg()
> writes it under, and the opts->can_attach = false lands inside the
> if (i < TPG_INSTANCES) arm added by e877b729c649 ("usb: gadget: f_tcm:
> out of bound access in usbg_drop_tpg"). If you would rather refuse the
> rmdir than auto-detach, note that fabric_drop_tpg returns void, so it
> cannot be failed from here.
> 
> Reproduced on Linux 7.3.0-rc3 (5dd1818b15d9) with KASAN under QEMU using
> dummy_hcd: create a tcm function and a target tpgt_1, write 1 to its
> "enable" attribute, link the function into a gadget config, rmdir tpgt_1
> without disabling it first, then bind the gadget to dummy_udc.0. With
> this patch applied the same sequence produces no KASAN splat.

I'm not reading all of that, and obviously no one else did either :(
