Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444781;
	b=2/sz31SPEFBCLssZbJx1po75hf3EzO5dbTiRL103N+WO83S+KYp809jUxUeUvxTywXud
	 UxSTITkc5U44gQ0Hs4VWIFbK4BtISGNLmp1HzZGLE5Rm4UTh3KJN4kauTDEGrA6tjQ0ez
	 PqX+yZJOtbLMOJKshIQ/yLwJFCdFrM7L0EDuQ7inVWSOnvd+fp6LW/pteg26x0I8pqnlx
	 /Hhs1fS36ntuRmsy6nVHTmwPZv814U5BCqOGNYA8cDeP+Uy23OanSTY0JZFiQ2Str6yno
	 7ycHZyIU9MHqhTf9loS7LkDGjx8lFcY6MPfLPfouQgEniQrY9xcMoswQCjupvJhFT7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444781;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UMzt/7uoeTgb8WLXa6idfM7zHOkdf6T6s/qadqwMs38=;
	b=Z7oBycyTuV2oNZXREDcERL83j2/By6Tu7aiBGzofNuuGTSJB+oDQS/b6eiEFjkFIkaZf
	 tcS5m3WcttS4nA6FASq7vpE/h7oI34NE+qJJ0vnfxhO2mR0q4DU2KFuC5Goz2O0/jXTbA
	 gUjJM+Gq4rqHyvjw08U6V6vUBBqgw7nmAokEi7uzsjy1BW3AstyjRyq7x7fGpQQpm3Cep
	 CzEjaz17pLRk+JqHedxYw3KtLpiyYnk5BHjgDRNW48XabfG+lHQxoV/j3JjZt7lbM5mIN
	 g3fbEakbITAATt8Px6suE+3usGjuyrKTwFdvgtNEp29ypJ8BznQ7uMPU9rdPdsAFL0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejdpgQp1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BD4606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 00:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ejdpgQp1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9EC1F00A05;
	Thu, 12 Nov 2026 00:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444780;
	bh=UMzt/7uoeTgb8WLXa6idfM7zHOkdf6T6s/qadqwMs38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ejdpgQp1t9FPPn65vjcCmdTAMdbEws3HP2Y4gC1Ra1FMCR1vOWj3L08ZYvGgnm30u
	 oIUXwHuKW4d2bJUa9ybjDevWFDoiYtlJ8c6fYpxB2GFpAgkasGjLdItZ8pVsjj04x6
	 pWFnoFmoLKdakSQ+4zRPFahR+0VvYs8pUL4+khzOZ/krBAVr2UCBpLuXecTRJK8e+D
	 mmPmL4o2GvOHJDwI6kAHVQx3NkkVxXMiFKHAlcisx1OuqWceSoJXT8IpUd2ZRMOBUx
	 rFhhA0AOPXb/bHsFxaaLqzlBCNrcDx/R+flZao0ZBW/pA3q+mMd7F9H8xkCRvd/raG
	 cttgvb9ZoAI6g==
Message-ID: <sashiko-outbox-209995@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: r8152: RTL8153 never runtime suspends with link up on a network
 with broadcast traffic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Menzel" <pmenzel@molgen.mpg.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
References: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:53:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] r8152: missing Signed-off-by trailer and inquiry-only commit
  message
- [Medium] r8152: race between rx_bottom() usb_mark_last_busy() and
  runtime suspend
- [Medium] r8152: unmasked RCR_AB and RCR_AM in
  rtl8152_runtime_suspend() fills RX FIFO
- [Low] r8152: sysfs write to runtime_wake_unicast_only does not update
  PLA_CONFIG5
--

commit f076dc10a806495496b9892d92a371cd04786dbb
Author: Paul Menzel <pmenzel@molgen.mpg.de>

> r8152: RTL8153 never runtime suspends with link up on a network with broa=
dcast traffic
>
> Dear Hayes, dear Linux folks,
>
> On a Dell XPS 13 9310 with a VIA Labs USB-C hub plugged in that has an
> RTL8153 (0bda:8153, bcdDevice 30.00, firmware rtl8153a-4 v3 06/12/25),
> the adapter never runtime suspends while the link is up, even with
> power/control set to auto. The hub and the Thunderbolt xHCI controller
> 00:0d.0 therefore stay in D0, and the package does not go deeper than
> PC8. I would like to ask how you would want this solved before sending a
> patch.
>
> AI disclaimer: claude-fable-5.2 analyzed and measured this on the laptop
> and drafted this message; I reviewed it.
>
> With Linux 7.3.3 (Debian 7.3.3-1), link up at 1000 Mb/s,
> power/control=3Dauto and autosuspend_delay_ms=3D2000, 60 s apart:
>
>      2-1.1.3: active susp=3D0 act=3D140886
>      2-1.1.3: active susp=3D0 act=3D201150
>
>      $ sudo turbostat --quiet --Summary --show
> Pkg%pc2,Pkg%pc3,Pkg%pc8,Pkg%pc9,Pk%pc10,SYS%LPI,PkgWatt --interval 30
> --num_iterations 1
>      Pkg%pc2 Pkg%pc3 Pkg%pc8 Pkg%pc9 Pk%pc10 SYS%LPI PkgWatt
>        14.26    9.19   71.33    0.00    0.00    0.00    0.84
>
> The cause is traffic that is not addressed to the station. In a 30 s
> capture of inbound frames on our institute network, 816 of 824 frames
> are broadcast (688, mostly ARP) or multicast (128), and 7 are addressed
> to the station. read_bulk_callback() calls usb_mark_last_busy() for
> every completed receive URB, so the autosuspend delay never elapses. If
> the device did suspend, rtl_runtime_suspend_enable() arms WAKE_ANY, so
> the next broadcast frame would wake it again.
>
> As an experiment, I added a module parameter (patch attached, against
> Linus=E2=80=99 master fa4ad798f6f6; tested as an out-of-tree build of the=
 v7.3.3
> driver). When set, only frames with a unicast destination address call
> usb_mark_last_busy(), and runtime suspend arms WAKE_PHY | WAKE_MAGIC |
> WAKE_UCAST instead of WAKE_ANY. With it, the adapter is suspended for
> 27.5 s of a 30 s interval:
>
>      2-1.1.3: suspended susp=3D130671 act=3D534403
>      2-1.1.3: suspended susp=3D158210 act=3D536981
>
> and, with runtime PM also enabled for the other devices in the hub, the
> xHCI controller reaches D3 and the package PC10:
>
>      Pkg%pc2 Pkg%pc3 Pkg%pc8 Pkg%pc9 Pk%pc10 SYS%LPI PkgWatt
>        13.40    7.53   15.40    1.39   59.08   56.32    0.84
>
> A ping from another subnet still wakes the device. In three attempts,
> the first echo request was answered once, after 78 ms, and lost twice.
>
> The experiment has an obvious cost: broadcast and multicast frames are
> lost while the device is suspended. That includes ARP requests and IPv6
> neighbour solicitations for the station=E2=80=99s own addresses, so a peer
> without a neighbour entry cannot reach the station until it transmits or
> receives a unicast frame.
>
> My questions:
>
> 1.  Do the RTL8153 and its successors support ARP and neighbour
> solicitation offload, or wake patterns, while selectively suspended?
> With that, the driver could program the addresses of the interface
> before suspending and keep answering for them, similar to what Wi-Fi
> drivers do with the ARP address list from mac80211. No new switch and no
> loss of reachability would be needed. If the hardware can do it, could
> Realtek add it or share the register description?
>
> 2.  If the hardware cannot do it, would you accept a per-device switch
> for the behaviour of the experiment, off by default? A module parameter
> is surely the wrong interface. A private flag (ethtool --set-priv-flags)
> would need no new uAPI, and userspace that knows the network
> configuration (systemd-udevd .link files, NetworkManager) could set it.
> Or do you see a generic interface for a "runtime wake filter", as other
> drivers that runtime suspend with the link up would have the same problem?
>
> 3.  Is losing the first frame that wakes the device expected, or should
> it be delivered after the resume?
>
> 4.  Is power/control=3Don by default intended for these adapters? I did
> not find 0bda:8153 in the autosuspend lists of systemd=E2=80=99s hwdb [1]=
 either.
>
> Kind regards,
>
> Paul
>
> [1]: https://github.com/systemd/systemd/tree/main/hwdb.d

[Severity: High]
This commit is missing a Signed-off-by: trailer, and the changelog is
written as a mailing-list inquiry rather than a commit description ready
for inclusion.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index d3bb7ee9c9bf3..39c586dc7d0cf 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -802,6 +802,17 @@ enum rtl8152_flags {
>  #define DEVICE_ID_THINKPAD_USB_C_DOCK_GEN3		0x3062
>  #define DEVICE_ID_THINKPAD_HYBRID_USB_C_DOCK		0xa359
> =20
> +/* While runtime suspended, wake only for link changes, magic packets and
> + * frames addressed to this station. Broadcast and multicast frames then
> + * neither wake the device nor postpone autosuspend, so they are lost wh=
ile
> + * the device is suspended, including ARP requests and IPv6 neighbour
> + * solicitations for the addresses of this station.
> + */
> +static bool runtime_wake_unicast_only;
> +module_param(runtime_wake_unicast_only, bool, 0644);
> +MODULE_PARM_DESC(runtime_wake_unicast_only,
> +		 "Ignore broadcast and multicast frames for runtime PM (default: N)");

[Severity: Low]
Does writing to /sys/module/r8152/parameters/runtime_wake_unicast_only
leave PLA_CONFIG5 stale on adapters that are already runtime suspended?

rtl_runtime_suspend_enable() only reads runtime_wake_unicast_only when
entering runtime suspend.  If an adapter is already suspended with
runtime_wake_unicast_only enabled (so BWF_EN and MWF_EN are cleared in
PLA_CONFIG5) and the parameter is changed back to N via sysfs, the
hardware wake filter is not updated until a separate event wakes the
device.

> @@ -2192,7 +2203,8 @@ static void read_bulk_callback(struct urb *urb)
>  	if (!netif_carrier_ok(netdev))
>  		return;
> =20
> -	usb_mark_last_busy(tp->udev);
> +	if (!runtime_wake_unicast_only)
> +		usb_mark_last_busy(tp->udev);
> =20
>  	switch (status) {
>  	case 0:
> @@ -3068,6 +3080,10 @@ static int rx_bottom(struct r8152 *tp, int budget)
>  			skb->ip_summed =3D tp->desc_ops.rx_csum(tp, rx_desc);
>  			tp->rx_desc.vlan_tag(rx_desc, skb);
> =20
> +			if (runtime_wake_unicast_only &&
> +			    !is_multicast_ether_addr(rx_data))
> +				usb_mark_last_busy(tp->udev);
> +
>  			if (use_frags) {

[Severity: Medium]
Can deferring usb_mark_last_busy() from read_bulk_callback() to
rx_bottom() race with rpm_suspend() and cause the adapter to suspend
immediately after receiving a unicast frame or drop queued packets?

<hardirq>                         kworker
read_bulk_callback()
  list_add_tail(&agg->list,
                &tp->rx_done)
  napi_schedule(&tp->napi)
                                  rpm_suspend()
                                    pm_runtime_autosuspend_expiration()
                                    dev->power.runtime_status =3D
                                      RPM_SUSPENDING
                                    rtl8152_runtime_suspend()
                                      napi_disable(napi)
                                        rx_bottom()
                                          usb_mark_last_busy(tp->udev)
                                      rtl_stop_rx(tp)
                                      delay_autosuspend(tp) -> false
                                      return 0  <-- suspends anyway

Once rpm_suspend() transitions runtime_status to RPM_SUSPENDING, it only
rechecks pm_runtime_autosuspend_expiration() if the suspend callback
returns -EBUSY or -EAGAIN.  Because neither rtl8152_runtime_suspend() nor
delay_autosuspend() checks whether rx_bottom() updated last_busy during
napi_disable(), the device suspends despite having just received a unicast
packet.

In addition, because read_bulk_callback() no longer resets the autosuspend
timer on broadcast or multicast URBs, rtl8152_runtime_suspend() can run
while multiple URBs or more than one NAPI budget of frames are queued in
tp->rx_done:

drivers/net/usb/r8152.c:rtl8152_runtime_suspend() {
    ...
		if (netif_carrier_ok(netdev)) {
			struct napi_struct *napi =3D &tp->napi;

			napi_disable(napi);
			rtl_stop_rx(tp);
    ...
}

When napi_disable() sets NAPI_STATE_DISABLE, __napi_poll() stops after a
single budget poll; rtl_stop_rx() then frees any overflow frames queued in
tp->rx_queue, and rtl_start_rx() reinitializes tp->rx_done on resume,
dropping any remaining unpolled URBs.

> @@ -3841,6 +3857,7 @@ static int rtl8152_set_features(struct net_device *=
dev,
>  }
> =20
>  #define WAKE_ANY (WAKE_PHY | WAKE_MAGIC | WAKE_UCAST | WAKE_BCAST | WAKE=
_MCAST)
> +#define WAKE_RUNTIME_UNICAST (WAKE_PHY | WAKE_MAGIC | WAKE_UCAST)
> =20
>  static u32 __rtl_get_wol(struct r8152 *tp)
>  {
> @@ -4346,7 +4363,8 @@ static bool rtl_can_wakeup(struct r8152 *tp)
>  static void rtl_runtime_suspend_enable(struct r8152 *tp, bool enable)
>  {
>  	if (enable) {
> -		__rtl_set_wol(tp, WAKE_ANY);
> +		__rtl_set_wol(tp, runtime_wake_unicast_only ?
> +			      WAKE_RUNTIME_UNICAST : WAKE_ANY);
> =20
>  		ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CRWECR, CRWECR_CONFIG);

[Severity: Medium]
Does leaving RCR_AB and RCR_AM enabled in PLA_RCR during runtime suspend
allow non-waking broadcast and multicast frames to fill the hardware RX
FIFO?

With runtime_wake_unicast_only enabled, __rtl_set_wol() clears BWF_EN and
MWF_EN in PLA_CONFIG5 so broadcast and multicast frames do not trigger USB
remote wakeup.  However, rtl8152_runtime_suspend() still restores the full
PLA_RCR value (including RCR_AB and RCR_AM) and ungates the RX FIFO before
entering selective suspend:

drivers/net/usb/r8152.c:rtl8152_runtime_suspend() {
    ...
			napi_disable(napi);
			rtl_stop_rx(tp);
			rxdy_gated_en(tp, false);
			ocp_write_dword(tp, MCU_TYPE_PLA, PLA_RCR, rcr);
			napi_enable(napi);
    ...
}

While suspended, the MAC continues accepting broadcast and multicast
frames into the hardware RX FIFO without waking the host.  Once those
frames fill the FIFO, the subsequent unicast frame that triggers UWF_EN
wakeup is dropped due to RX FIFO overflow, and only the buffered
broadcast and multicast frames are delivered on resume.  Masking RCR_AB
and RCR_AM out of rcr when runtime_wake_unicast_only is set would prevent
non-waking traffic from consuming the RX FIFO during selective suspend.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/fba64030-4f1e-4158-=
ae39-bc072bc5751d@molgen.mpg.de?part=3D1
