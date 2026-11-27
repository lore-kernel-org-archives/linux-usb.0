Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753630;
	b=lcrq0rr3hiVaaU5nSapC/OR4R/9Q23BMk680/RjT1x5qLbmy5x0K/BgcjJPYhKtwtE9T
	 bJsJ7KCTp2cWwNw6NZlDarP7XdH0FL4efl0Phw7BqrqLGebvgXqhp4nbxiqIBZcGrNPe+
	 2XOFeWQh6okv/4rxvZs7AIrhRy8y80TS8FGbRnbK+zXW4rkrH3y/ip5WH5zq98kQj6NfV
	 XfrrEGaQrxuKbNeIANftQQC6vVB5IVmmCDyPtqiuQHgpBoCUOea2OLoVQ+vguEqQ+x0mI
	 APDfWhcXlNcBBni4+mjOXogWVrkwiSFCoIF6s81dIybnyFP2O6oe8AcPk/3VKdQpKUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753630;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ylyv5T+j/H353gU/iBllM/7cj9PHM7kAr+dpqaujsro=;
	b=cQUZjWwYCPw4DkqpaIUrrcTfMEG2xHPW9dH0fMbM6mOHm8wXtGhBIXG+QTnN8ljIyXv3
	 FEYGTBPCSLeUI14SsXfCKotX9acbmcU4DXgVKdmnoHhcI7eZg4A4RqCrDS2PDCMa34GOa
	 kENNYvCOvmGPg38vZ1fR3UxKwSx8STOxIGZSPCEVUjbfTZKmTl01nAUzOOtQstWSVYwqv
	 GwTOao/341XQZ59XkY+HkF/KHYGWp62L/DWuqUNDAPFtLEtcILXxxgCGmQPY+D/SdjbW7
	 pcdfiQi1yICJ8pu6yyx5Ln7CkRPG0yN3Wr5uVaTBl4L6gx6ZMP4xsZkW5QmLSRigRJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOkIE2Bl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B6C606A68E;
	Fri, 27 Nov 2026 04:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lOkIE2Bl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237941F00A16;
	Fri, 27 Nov 2026 04:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795753629;
	bh=ylyv5T+j/H353gU/iBllM/7cj9PHM7kAr+dpqaujsro=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=lOkIE2BlNa+CxSXA22P/iN+D7mz9DE8R7md7h0LuLlQJt7Q71dWJegMCjFTerWueQ
	 vj5Vpf6D+cv66LyCTULBxFBq/DixfC8jw1RKLgR3UpsVE+vgPQj5mVzb90aCTDWE9C
	 asFSE/1CfwVdT89zI/LU+8xYX9p20is0tOW+dM0DgLK2jiXGuXneEdg+ag0+bQG85W
	 31Wign0kAroSapof41sAj2wDXo2ppeH1ylF6Q0x7ZTvy71ns0TSbTngaSDMi6BFhqS
	 lp17dKVGp065L+wY76RY5vsKy0g9cZbVQQKyyzMAdjB+59HjNlfrBoJtrKgbN1rmyY
	 kJg0PoTZLf0WA==
Subject:
 Re: [PATCH net-next v9 12/12] r8152: enable UPS for RTL8157 and RTL8159 QFN68
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Fri, 27 Nov 2026 04:27:08 +0000
Message-ID: <179575362872.3135.13750134827744924727@kernel.org>
In-Reply-To: <20261126033211.51850-13-nic_swsd@realtek.com>
References: <20261126033211.51850-13-nic_swsd@realtek.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 5 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] On RTL8157 (RTL_VER_16), the probe/reset_resume path and the
  new runtime-resume path disagree about the backup-restore wait after a…
- [Medium] r8157_ups_en(tp, false) adds a permanent failure mode to
  runtime resume.
- [Medium] In the new runtime-resume path of rtl8157_runtime_enable(tp,
  false), r8157_ups_en(tp, false) runs only after r8153_queue_wake(tp,…
- [Medium] r8157_ups_en(tp, false) polls USB_GPHY_CTRL.BACKUP_RESTRORE
  with a 20 ms timeout after every power cut, for every chip it is…
- [Medium] When PCUT_STATUS is set, the power-cut recovery branch of the
  new r8157_ups_en(tp, false) waits for BACKUP_RESTRORE, clears…
- [Low] To force the USB MCU firmware to be re-applied after a power cut,
  r8157_ups_en(tp, false) writes 0 to a hard-coded register,…

--

r8152: enable UPS for RTL8157 and RTL8159 QFN68

This patch adds r8157_ups_en() and calls it from rtl8157_runtime_enable(),
so RTL8157 and RTL8159 QFN68 enter and exit UPS across runtime suspend and
resume. It also extends r8156_ups_flags() with per-speed EEE flags and
5G/10G speed encodings for these chips. On the UPS disable path the driver
waits for backup-restore after a power cut, then applies the PHY
configuration again.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index e6a5d35403a28..e294e52b426b5 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -4496,6 +4534,58 @@ static void r8156_ups_en(struct r8152 *tp, bool enable)
>  	}
>  }
>  
> +static void r8157_ups_en(struct r8152 *tp, bool enable)
> +{

[ ... ]

> +		if (ocp_data & PCUT_STATUS) {
> +			ret = read_poll_timeout(ocp_read_word, ocp_data,
> +						test_bit(RTL8152_INACCESSIBLE,
> +							 &tp->flags) ||
> +						(ocp_data & BACKUP_RESTRORE),
> +						200, 20000, false, tp,
> +						MCU_TYPE_USB, USB_GPHY_CTRL);

[Severity: Medium]
Does RTL8157 (RTL_VER_16) set BACKUP_RESTRORE by itself after a
power cut?

r8157_init() only waits for it on the RTL8159 variants:

r8157_init() {
    ...
	switch (tp->version) {
	case RTL_VER_17_QFN68:
	case RTL_VER_17_QFN100:
		if (r8159_wait_backup_restore(tp)) {
    ...
}

The only other user of BACKUP_RESTRORE in the driver is
rtl8152_fw_phy_nc_apply(), where software sets the bit itself.

Suppose RTL8157 never asserts the bit. Every runtime resume after a UPS
power cut on RTL_VER_16 would then time out here after 20 ms and mark the
device inaccessible. hw_phy_cfg() and rtl8152_set_speed() would be
skipped, and the r8157_u2p3en(true) and r8153b_u1u2en(true) writes after
it would be dropped. Is that what happens?

The commit message says the wait applies "on RTL8157 as well as RTL8159",
but r8157_init() treats RTL8157 as not needing it. Which one is correct
for this chip?

> +			if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +				return;
> +
> +			if (ret) {
> +				rtl_set_inaccessible(tp);
> +				dev_err(&tp->intf->dev,
> +					"backup-restore timed out\n");
> +				return;
> +			}

[Severity: Medium]
Can this leave the NIC permanently unusable after a runtime resume?

The call chain is:

rtl8152_resume()->rtl8152_runtime_resume()->
    tp->rtl_ops.autosuspend_en(tp, false)->rtl8157_runtime_enable()->
        r8157_ups_en(tp, false)

r8157_ups_en() returns void, and rtl8152_runtime_resume() returns 0 in
every case.

rtl8152_resume() skips its existing inaccessible recovery for runtime
resume:

	if (!runtime_resume && test_bit(RTL8152_INACCESSIBLE, &tp->flags))
		usb_reset_device(tp->udev);

After the timeout, every generic_ocp_read() and generic_ocp_write()
returns -ENODEV. The interface then stays unusable until a replug.

The commit message acknowledges this and leaves recovery to a follow-up
series. Runtime resume runs far more often than probe or reset_resume, and
before this patch rtl8157_runtime_enable(false) could not fail this way.
Could this path call usb_queue_reset_device(), as rtl8152_tx_timeout() and
the control message error path already do?

> +
> +			/* clear USB fw_ver_reg */
> +			ocp_write_byte(tp, MCU_TYPE_USB, USB_FW_USB_VER, 0);

[Severity: Low]
rtl8152_fw_mac_apply() does not look at USB_FW_USB_VER when deciding
whether to skip a block. It uses the register named in the firmware blob:

	fw_ver_reg = __le16_to_cpu(mac->fw_ver_reg);
	if (fw_ver_reg && ocp_read_byte(tp, MCU_TYPE_USB, fw_ver_reg) >= mac->fw_ver_data) {

Nothing in the driver links 0xcfd7 to the USB block's fw_ver_reg. If a
current or future rtl8157/rtl8159 blob names a different register, would
the USB MCU patch be skipped after the power cut?

This code also leaves the PLA block's version register alone. If the power
cut drops the PLA patch, would that patch be applied again?

Could this use the fw_ver_reg values from tp->rtl_fw rather than a
hard-coded register?

> +
> +			tp->rtl_ops.hw_phy_cfg(tp);

[Severity: Medium]
Is a wait_autoload_done() call needed before hw_phy_cfg() here?

The other runtime UPS implementations wait for autoload in the same power
cut branch. For example, r8153b_ups_en():

		if (ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0) & PCUT_STATUS) {
			if (wait_autoload_done(tp))
				return;

			tp->rtl_ops.hw_phy_cfg(tp);

r8157_init() also runs r8156b_wait_loading_flash(), then
wait_autoload_done(), then the backup-restore wait, all before PHY setup.

Before applying firmware and PHY parameters, r8157_hw_phy_cfg() only calls
r8156b_wait_loading_flash(). So this path checks backup-restore first and
flash loading second, the reverse of the init order.

r8156_ups_en(), which this function mirrors, also lacks the wait. But
r8156_ups_en(tp, true) has no caller, so its power cut branch has never
run at runtime.

If autoload is still running after the power cut, could it overwrite the
PHY parameters or MAC firmware that hw_phy_cfg() writes?

> +
> +			rtl8152_set_speed(tp, tp->autoneg, tp->speed,
> +					  tp->duplex, tp->advertising);
> +		}
> +	}
> +}

[ ... ]

> @@ -4654,9 +4744,28 @@ static void rtl8157_runtime_enable(struct r8152 *tp, bool enable)
>  		r8153b_u1u2en(tp, false);
>  		r8157_u2p3en(tp, false);
>  		rtl_runtime_suspend_enable(tp, true);
> +
> +		switch (tp->version) {
> +		case RTL_VER_16:
> +		case RTL_VER_17_QFN68:
> +			r8157_ups_en(tp, true);
> +			break;
> +		default:
> +			break;
> +		}
>  	} else {
>  		r8153_queue_wake(tp, false);
>  		rtl_runtime_suspend_enable(tp, false);
> +
> +		switch (tp->version) {
> +		case RTL_VER_16:
> +		case RTL_VER_17_QFN68:
> +			r8157_ups_en(tp, false);
> +			break;
> +		default:
> +			break;
> +		}

[Severity: Medium]
Should r8157_ups_en(tp, false) run before r8153_queue_wake(tp, false) and
rtl_runtime_suspend_enable(tp, false)?

As written, the PLA wake and WOL registers are written again before UPS
is exited and before the backup-restore wait. These are
PLA_INDICATE_FALG, PLA_SUSPEND_FLAG, PLA_EXTRA_STATUS, PLA_CRWECR and
PLA_CONFIG34.

The other chips with runtime UPS use the opposite order. For example,
rtl8153b_runtime_enable():

	} else {
		r8153b_ups_en(tp, false);
		r8153_queue_wake(tp, false);
		rtl_runtime_suspend_enable(tp, false);

The restore after a power cut could still be running when saved_wolopts
is restored and LINK_OFF_WAKE_EN and UPCOMING_RUNTIME_D3 are cleared.
Could it then bring back the suspend-time wake configuration?

There is also a second ordering change. hw_phy_cfg() and
rtl8152_set_speed() now run after LINK_CHG_EVENT and LINK_CHANGE_FLAG
have been cleared, which the 8153b/8153c sequence does not do.

> +
>  		r8157_u2p3en(tp, true);
>  		if (tp->udev->speed >= USB_SPEED_SUPER)
>  			r8153b_u1u2en(tp, true);

[ ... ]

> @@ -9141,7 +9250,7 @@ static void r8157_init(struct r8152 *tp)
>  	ocp_write_word(tp, MCU_TYPE_USB, USB_U1U2_TIMER, 500);
>  
>  	r8157_power_cut_en(tp, false);
> -	r8156_ups_en(tp, false);
> +	r8157_ups_en(tp, false);

[Severity: Medium]
Can the PCUT_STATUS branch of r8157_ups_en() ever run from here?

r8157_power_cut_en(tp, false) clears the flag just before the call:

r8157_power_cut_en() {
    ...
	} else {
		ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_POWER_CUT, PWR_EN);
		ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_MISC_0, PCUT_STATUS);
    ...
}

As a result, the init path never runs the backup-restore wait, the
USB_FW_USB_VER clear or the PHY reconfiguration.

This matters more now that RTL_VER_16 can be power cut at runtime. On a
reset_resume after a runtime UPS power cut, rtl8152_reset_resume() goes
through ops->init rather than autosuspend_en(false):

	clear_bit(SELECTIVE_SUSPEND, &tp->flags);
	rtl_reset_ocp_base(tp);
	tp->rtl_ops.init(tp);
	queue_delayed_work(system_dfl_long_wq, &tp->hw_phy_work, 0);

r8157_init() only waits for backup-restore on RTL_VER_17_QFN68 and
RTL_VER_17_QFN100, so RTL_VER_16 takes the default case. After that,
r8157_hw_phy_cfg() from hw_phy_work only waits for flash loading.

Would RTL8157 then start PHY setup without waiting for backup-restore? On
this path USB_FW_USB_VER is also never cleared, for either chip.

So either the RTL8157 wait in r8157_ups_en() is not needed, or
r8157_init() is missing it for the state this patch creates. Which one is
intended?

Separately, the poll in r8157_ups_en() duplicates
r8159_wait_backup_restore(), with the same register, bit and 200 us /
20 ms timing. Could it call the helper instead, so the two sites stay in
sync?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126033211.51850-1-nic_swsd%40realtek.com
