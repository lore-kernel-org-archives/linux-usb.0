Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523437;
	b=CDkaOKeyf/jtF8UBtiSyhTWIf2Doj0QmI7C+iUHkDB6kpxM5E3xolLzvRShVM05+l23h
	 CRIfHW9LdzktU8aleIABcLmxPDKTtA3Moc6e477BI9gnhVqQVzaAc3toHF4Sy5YL+RWAh
	 tA06Rx4oyf93MzwoW2KzTiJupZGE02rR4FfKro794RPJ2SIMv8eBMdmbd/rv+aiHxVXag
	 UOUsYnaxQ7G/4nIUOfqen2hd8WtmE6EYp+mWYe/ZcDM2HbLzvNV4xoT9gydN4UHrPgLH7
	 MTLF3DFAPzWyJp6mJT21Xt/7qHisGF/VfAzHomfHGotKgSv2rh7ItE6hj5DLPJTxJNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523437;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DMPNZchYUXAtwehIK7vlljCTJPCza5ZwhkvTZtKsMCs=;
	b=Tpme4ShFxiC/xVJLFC6Sfeee6hx80ZjhcACAiGFH4SmBJZsgF37EZVPWt1KpuPQ8RTgh
	 0XI2AUhV5uXEDCmWIAeOzshDywnHKe3L2I1UeRDCeNsLyEB5Ydo61wr0agpJ7fk2JrDdM
	 yFJZSgAIHnCTlVr5t+COj1hLsculWHHoLQ4dsnIGEywwxjZ7kupgkMN0JZULJ42GSmUg+
	 Y3+/b//CLPbHpxlKI5P2639OTNnajcHVQiY5RxWyvwwZ7O2Z8xUt7NjcjXK53gxQBGc+u
	 p4iohCg0Rev17rQ5PE55gDiMQVym+y0jEdKETFRo4ZadEwafEADNMfvsleXiUyJLWaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddjD9Lta;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302C1606A32C;
	Tue, 24 Nov 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddjD9Lta
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311301F000E1;
	Tue, 24 Nov 2026 12:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523436;
	bh=DMPNZchYUXAtwehIK7vlljCTJPCza5ZwhkvTZtKsMCs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ddjD9LtaKuCVkbyojVHPhNS4t+pc55bD4CUt6VEN1qwQhxvzSRKM1oI7yFCfQlNme
	 hEeDcowmUheWXIIiTXTk5YSG5WeoiWo1QFQ/VW76y8vl1m2rpuZzlmPZE2+c0ZjiWV
	 2cKXHfoiPP3AyoQySMWUAd19CJsdSvaLakRVxz/BVAYig15XmJVT8odLnXFa0JhY+R
	 u5LheZ3nyc7ldOIKxmPY5i9visrPOXSz68/V7aBCJrvdYkolQG/cMXGRa+ZHCFlH15
	 bMz8Q8O11rx10h+n62Kd7KxjnyKV7EvOBl5CORhghTQFACIEFqVyaUoW6qBjuAC9pK
	 u/ZTp38una2eQ==
Subject: Re: [PATCH net] r8152: do not (un)register the PM notifier under RTNL
From: netdev-bot+sashiko@kernel.org
To: yuanhsinte@chromium.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, hayeswang@realtek.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, yuanhsinte@google.com
Date: Tue, 24 Nov 2026 12:30:35 +0000
Message-ID: <179552343569.3135.5205506648034787768@kernel.org>
In-Reply-To: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com>
References: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Moving unregister_pm_notifier() out of rtl8152_close() removes
  the only thing that kept rtl_notifier() from racing ndo_stop.
- [Low] The commit author address does not match the Signed-off-by
  address.

--

r8152: do not (un)register the PM notifier under RTNL

This patch moves register_pm_notifier() and unregister_pm_notifier() out
of the ndo_open and ndo_stop handlers. They now run in
rtl8152_probe_once(), its error path and rtl8152_disconnect(), which
avoids a deadlock between RTNL and the PM notifier chain rwsem. It also
adds a PM_NOTIFIER_AUTOPM_HELD flag, so the runtime PM reference taken
by rtl_notifier() is only dropped if it was actually taken.

> Fixes: 5ee3c60c8d3b ("r8152: fix the wake event")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@google.com>

[Severity: Low]
The Author line uses yuanhsinte@chromium.org, but the only Signed-off-by
uses yuanhsinte@google.com. Should these match?

checkpatch reports this as FROM_SIGN_OFF_MTCH ("From:/Signed-off-by:
email address mismatch").

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index d3bb7ee9c9bf3..fea47a8924149 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -7155,9 +7158,6 @@ static int rtl8152_close(struct net_device *netdev)
>  	struct r8152 *tp = netdev_priv(netdev);
>  	int res = 0;
>  
> -#ifdef CONFIG_PM_SLEEP
> -	unregister_pm_notifier(&tp->pm_notifier);
> -#endif
>  	tasklet_disable(&tp->tx_tl);
>  	clear_bit(WORK_ENABLE, &tp->flags);
>  	usb_kill_urb(tp->intr_urb);

[Severity: High]
Can rtl_notifier() now race with rtl8152_close()?

Before this patch, rtl8152_close() started with unregister_pm_notifier(),
which does down_write(&pm_chain_head.rwsem). That call waited for the
whole PM_SUSPEND_PREPARE chain to finish, including the synchronous
runtime resume started from rtl_notifier():

rtl_notifier()
  usb_autopm_get_interface()
    rtl8152_resume()            /* takes tp->control */
      rtl8152_runtime_resume()

The notifier now stays registered for the whole lifetime of the device.
Nothing seems to stop this path from overlapping ndo_stop.
rtl8152_runtime_resume() checks netif_running() once and then does:

	tp->rtl_ops.autosuspend_en(tp, false);
	napi_disable(napi);
	set_bit(WORK_ENABLE, &tp->flags);
	...
	napi_enable(napi);
	...
	usb_submit_urb(tp->intr_urb, GFP_NOIO);

At the same time, __dev_close_many() holds RTNL, clears
__LINK_STATE_START and calls rtl8152_close(). That function does the
following without tp->control or an autopm reference:

	tasklet_disable(&tp->tx_tl);
	clear_bit(WORK_ENABLE, &tp->flags);
	usb_kill_urb(tp->intr_urb);
	cancel_delayed_work_sync(&tp->schedule);
	napi_disable(&tp->napi);

If the napi_disable() in close runs first, would the napi_disable() in
rtl8152_runtime_resume() loop forever? NAPI stays disabled until the
next open. The resuming task holds tp->control and holds
pm_chain_head.rwsem for read.

rtl8152_close() would then block in usb_autopm_get_interface(), waiting
for that resume while still holding RTNL. That looks like the same
suspend/RTNL hang the commit message describes.

If the napi_disable() in the resume path runs first, close waits for its
napi_enable(). The resume path then sets WORK_ENABLE and resubmits
tp->intr_urb, which undoes the teardown. Close then continues into
rtl_ops.down() and free_all_mem():

free_all_mem()
	usb_free_urb(tp->intr_urb);
	tp->intr_urb = NULL;

	kfree(tp->intr_buff);
	tp->intr_buff = NULL;

Is the interrupt URB still queued at the HCD at that point? If so,
intr_callback() would read the freed tp->intr_buff and resubmit the URB.
That would be a use-after-free, with DMA into freed memory.

Other autoresume sources, such as remote wakeup or hw_phy_work, can
already race close this way. The PM notifier, though, is a new trigger
added by this change.

This needs an interface that is up but runtime-suspended, and an ifdown
that runs at the same time as the start of system suspend or
hibernation. PREPARE notifiers run before tasks are frozen, so these two
can overlap.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51%40google.com
