Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35A73F9F35
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922210; cv=none; b=c1ME6KYSGwGtyXAxtX2A5DJT03jaNy+8p6DTkcKlsY6IeNlijHwuY04Zc7f0XqTJAPXvn3PCSCzGJoEbjdhBqUytASbWLbQArIVjuIOC4s/I794pNxrvMBNeo0a5ITkQJG4wNQ+tKLciHzdGK6QUN3fUq84h0ioAE6gxYsQMAR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922210; c=relaxed/simple;
	bh=sv3lvOTItSxieKXP3fZX3xS7SUezf88THrL0mDWbwSc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uAFU+Yyhyo5vNQhWfsTeolTFgEVN8A/kkcOVOt5JDSXJItkflPZ126jpZHNGdOutYAoJ5G4uFwaW7bowq2NQTM/6+QmyHWaRGbuEmGuqSYFcbvpRLrMBi67yT60cF1XEY/vf2z3VQy46nN2eSRKqzLh7ChzxnISFtWGpkmDP7IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lJ18OLGl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fSVBK4y2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=l8PnJLSM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GmSMUXlr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lJ18OLGl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fSVBK4y2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="l8PnJLSM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GmSMUXlr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5E7A7FD2C;
	Wed,  5 Aug 2026 09:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785922203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=domFYvjUcbMdy9VjDWsZPgPHsh1vtSYJ0nKCiTUGNhQ=;
	b=lJ18OLGlltbh7RgL387fNW2XKV+iso2i3J3rUdWIvwl7/YSZgOmCx8y2Vkgy3Y2Ho2W6ve
	2xUh/VSWSatSAiTgl20StrjhHqZ3teT7PgFmNARMZKY6RpHvU+9nIsl1mh76ojSy3HQ3N6
	pBW1xrAp+h4oIv8BU6xzrrt/brA+3RI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785922203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=domFYvjUcbMdy9VjDWsZPgPHsh1vtSYJ0nKCiTUGNhQ=;
	b=fSVBK4y2bBRU+iGMVWEZFYXm00atk98a7kBYThMPt0m/Bo5tuIKjMPBsdOEl9w394XBWhv
	TGauL/6eMg2YnlBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=l8PnJLSM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GmSMUXlr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785922198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=domFYvjUcbMdy9VjDWsZPgPHsh1vtSYJ0nKCiTUGNhQ=;
	b=l8PnJLSMFIlofivb8VeCfm0h/5aSBQDDJEphI5cB/Bzzi105giTzkzuWnJdH1UkOt1f6RE
	V7vJMuBoIyc/WUBRGwT57gfymZK1mDVnB5yLtHCqW1vVM1nKSRyLXCsjtZELqdkyGfCEU6
	uGfFgCLIK2KFVzY0D1ISTxsJrb0FoTI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785922198;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=domFYvjUcbMdy9VjDWsZPgPHsh1vtSYJ0nKCiTUGNhQ=;
	b=GmSMUXlrfQfvx8TMT1SzsStXYkjBU9R6uzRMM4XFQmaYqLESB35pe2IjE9Hs1lDMJFxmTi
	jaw7XUF0V/glMwCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9A19779C3;
	Wed,  5 Aug 2026 09:29:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Q50PLJYCc2qoNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Aug 2026 09:29:58 +0000
Date: Wed, 05 Aug 2026 11:29:58 +0200
Message-ID: <8733wshq3t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?1cW9qA==?= <soldierjazz2013@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-usb@vger.kernel.org
Subject: Re: [BUG REPORT] sound/usb: Fix Use-After-Free in snd-usb-audio error_timer during device disconnect
In-Reply-To: <CAEoG+NRpPip1Eymi1ZSgG7FdYH2UkRneat2GJRWXL_M38xfD9w@mail.gmail.com>
References: <CAEoG+NRpPip1Eymi1ZSgG7FdYH2UkRneat2GJRWXL_M38xfD9w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: E5E7A7FD2C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Wed, 05 Aug 2026 11:19:54 +0200,
张建 wrote:
> 
> 
> Hi Takashi and Linux USB/ALSA maintainers,
> 
> We identified a reproducible Use-After-Free (UAF) kernel panic in sound/usb/
> midi.c during USB MIDI device hot-unplug under active URB transfers.
> 
> The issue was reproduced on Qualcomm platforms (Snapdragon 8 Gen 3 Linux
> 6.1.145 / Android 14, Snapdragon 8 Elite Linux 6.6.77 / Android16 etc.). The
> crash consistently hits __run_timers (timer softirq) dereferencing poison
> pointer.
> 
> Crash Trace
> 
> [  169.493907] I[ 1: surfaceflinger: 1794] Internal error: Oops - CFI: 00000000f2008234 [#1] PREEMPT SMP
> [  169.493941] I[ 1: surfaceflinger: 1794] sec,qc-rst_exinfo soc:samsung,qcom-rst_exinfo: fault handler : unknown
> [  169.495442] I[ 1: surfaceflinger: 1794] CPU: 1 PID: 1794 Comm: surfaceflinger Tainted: G S      WC O       6.1.145-android14-11-3254743-abS9280ZCS6DZF2 #1
> [  169.495447] I[ 1: surfaceflinger: 1794] Hardware name: Samsung E3Q PROJECT (board-id,09) (DT)
> [  169.495455] I[ 1: surfaceflinger: 1794] pstate: 02400005 (nzcv daif +PAN -UAO +TCO -DIT -SSBS BTYPE=--)
> [  169.495464] I[ 1: surfaceflinger: 1794] pc : call_timer_fn+0x44/0x26c
> [  169.495471] I[ 1: surfaceflinger: 1794] lr : __run_timers+0x1b8/0x30c
> [  169.495475] I[ 1: surfaceflinger: 1794] sp : ffffffc00800be40
> [  169.495480] I[ 1: surfaceflinger: 1794] x29: ffffffc00800be40 x28: dead000000000122 x27: 0000000000000000
> [  169.495490] I[ 1: surfaceflinger: 1794] x26: ffffffc00800be90 x25: 0000000000000001 x24: ffffff8a713312b0
> [  169.495501] I[ 1: surfaceflinger: 1794] x23: ffffffc00a427000 x22: ffffff8868a70000 x21: ffffff804c485c40
> [  169.495511] I[ 1: surfaceflinger: 1794] x20: ffffff804c485c58 x19: 0000000000000100 x18: 0000000000000000
> [  169.495522] I[ 1: surfaceflinger: 1794] x17: 0000000091b4a83a x16: 0000000000000000 x15: 0000000000000000
> [  169.495532] I[ 1: surfaceflinger: 1794] x14: ffffff804c485c40 x13: 000000000000000d x12: 0000000000000028
> [  169.495542] I[ 1: surfaceflinger: 1794] x11: ffffffc00800be98 x10: ffffff8a71331240 x9 : 0000000100000100
> [  169.495553] I[ 1: surfaceflinger: 1794] x8 : 0000000100000100 x7 : 0000002776497736 x6 : 0000002776497736
> [  169.495563] I[ 1: surfaceflinger: 1794] x5 : 0000002776497736 x4 : 0000000000000001 x3 : 00000000000009c4
> [  169.495573] I[ 1: surfaceflinger: 1794] x2 : 00000000ffff808d x1 : ffffff804c485c58 x0 : ffffff804c485c40
> [  169.495584] I[ 1: surfaceflinger: 1794] Call trace:
> [  169.495591] I[ 1: surfaceflinger: 1794]  call_timer_fn+0x44/0x26c
> [  169.495598] I[ 1: surfaceflinger: 1794]  __run_timers+0x1b8/0x30c
> [  169.495605] I[ 1: surfaceflinger: 1794]  run_timer_softirq+0x24/0x4c
> [  169.495614] I[ 1: surfaceflinger: 1794]  handle_softirqs+0x120/0x3e0
> [  169.495621] I[ 1: surfaceflinger: 1794]  __do_softirq+0x14/0x20
> [  169.495628] I[ 1: surfaceflinger: 1794]  ____do_softirq+0x10/0x20
> [  169.495635] I[ 1: surfaceflinger: 1794]  call_on_irq_stack+0x3c/0x74
> [  169.495641] I[ 1: surfaceflinger: 1794]  do_softirq_own_stack+0x1c/0x2c
> [  169.495648] I[ 1: surfaceflinger: 1794]  __irq_exit_rcu+0x54/0xb4
> [  169.495655] I[ 1: surfaceflinger: 1794]  irq_exit_rcu+0x10/0x1c
> [  169.495665] I[ 1: surfaceflinger: 1794]  el0_interrupt+0x54/0x174
> [  169.495671] I[ 1: surfaceflinger: 1794]  __el0_irq_handler_common+0x18/0x28
> [  169.495677] I[ 1: surfaceflinger: 1794]  el0t_64_irq_handler+0x10/0x1c
> [  169.495683] I[ 1: surfaceflinger: 1794]  el0t_64_irq+0x1a4/0x1a8
> [  169.495690] I[ 1: surfaceflinger: 1794] Code: 72950751 72b23691 6b11021f 54000040 (d4304680) 
> [  169.495696] I[ 1: surfaceflinger: 1794] ---[ end trace 0000000000000000 ]---
> 
> Root Cause & Race Condition
> 
> There is a sequence defect in snd_usbmidi_disconnect() combined with the URB
> completion handler:
> 
>  1. In snd_usbmidi_disconnect(), del_timer_sync(&umidi->error_timer) is
>     invoked BEFORE killing in-flight IN URBs via usb_kill_urb().
>    
>  2. Prior to usb_kill_urb() finishing, an in-flight IN URB completes with an
>     unconventional error status (e.g., -EPIPE) when USB disconnect.
>    
>  3. snd_usbmidi_in_urb_complete() calls snd_usbmidi_urb_error(urb). When
>     receiving non-disconnect error codes (This error code is outside the scope
>     of the error codes handled by snd_usbmidi_urb_error.), it invokes 
>     mod_timer(&ep->umidi->error_timer, ...) without checking umidi->
>     disconnected.
>    
>  4. This re-arms error_timer AFTER del_timer_sync() has already executed.
>    
>  5. snd_usbmidi_disconnect() completes and frees struct snd_usb_midi in 
>     snd_usbmidi_free.
>    
>  6. Later when error_timer fires on deallocated memory, leading to a UAF panic
>     in __run_timers.
>    
> Please let us know your thoughts on this issue.

Could you verify the issue with the very latest Linus tree, too?


thanks,

Takashi
