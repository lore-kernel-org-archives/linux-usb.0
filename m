Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795753628;
	b=ZfSTb9hLBmM0CYryHjSa+pW/VS2zGEr2EDmYKUTIHZMG8VOvAxK3WDBmihh6fPvEYBkw
	 JHVsKAIDHqebuuShWttVr8uI6/1TajTouoOo+Q3DAP7aXAK07ddfq94ObylVZtv+jCbZ6
	 4ydZfMVAbsdhr+KaBxUxG0RqFXHYVGsliQJ7TClVH6+2FYwErtVEj5OUr9Tc1R2tVbEP2
	 QzSipuJOAOI7Fr8fbL+2KHa7zR1GLoaEInbaAO4CnW3vgeMeu83FXf6TGGJmH3QEfqV61
	 2guYFfrgbANX4YvVvbuPmj0+6T6V1/3w7Sfs0ovMjoQIGY1FJEFvc3B8eJIIw1x/XIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795753628;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=owiT0dO+NAJLzkZxl1vWyr3zL3I8AJW2WvC6QRl0yjY=;
	b=yfjS/EfRj/LuJyZCLECAKHiiRl6FzENUYK6XkdXkp6hBQJbugHGyLCN0XRwSnQEPALf0
	 JDK9NCVmvUtxQFRkO57bzYaCA3Cmm9pNXPQUMiDaXw3HnxfFe1crOxHGaZm0mStXBH2Gw
	 3Oj3Njat2M+o4FoH46KSCTwAB0iyPqogsgxdLVOil0q4kcGZ4JG6xsDLpVUpU82lMk1wj
	 vPnuWvAYQSfa5jPvUYNjyojBbKrrbd7P0ZehCLIUTFxoSSWbw7qORcYJlxDpj0r8TXiNl
	 ZD3w4qg25WAsMXMivWgcpGSGlBf4dtzPq58ddqBf0nzEypm5/45FGMqyas3Syrjf+LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKLQFYwr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6FD606A69B;
	Fri, 27 Nov 2026 04:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKLQFYwr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764441F00926;
	Fri, 27 Nov 2026 04:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795753628;
	bh=owiT0dO+NAJLzkZxl1vWyr3zL3I8AJW2WvC6QRl0yjY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FKLQFYwrAH+EK0XxHET4H4zNIs3liEM6NKAhA27pTqVleF1upC9TE7adprNru+isv
	 IRIPOc/BAfLCyf71FK5QN5FfbVv3wdrLFxAIrTXikxGVX3rA8GacIdGufhzlbXmel1
	 l28eMLlkPRD0iUfAFtadbJKYrvVM7H1xUgGTfpn3f+Dy2J+p/6nitN6A5o/sZh7RCz
	 +GnctvuZEgVk0renH0tzlpBdwH4XENJ8fggAeWLRVhZ2+382Im8yBFMfpFV+yqN3SL
	 bhf3Q7DA017ipc/9/lysNqMAhpD5gEtGBZe+oVMy3hdUvIFr2i+zunqsNP+M5OzfTa
	 CYj5YinQIMYWQ==
Subject: Re: [PATCH net-next v9 11/12] r8152: add TGPHY register access for
 RTL8157 and RTL8159
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Fri, 27 Nov 2026 04:27:07 +0000
Message-ID: <179575362702.3135.11502039200918587671@kernel.org>
In-Reply-To: <20261126033211.51850-12-nic_swsd@realtek.com>
References: <20261126033211.51850-12-nic_swsd@realtek.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 5

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] set_carrier() now returns early when the BMSR read fails, and
  the link-change event is lost.
- [Low] rtl_tgphy_access() reports a write as successful once the command
  has been posted.
- [Low] Two statements in the commit message are not quite right.
- [Low] read_mii_word() now returns 0 for a failed PHY read, and the MII
  library callers in drivers/net/mii.c take that 0 as real register…
- [Low] rtl_tgphy_access() relies on the comment 'A failed control
  transfer latches RTL8152_INACCESSIBLE' and ignores the return values…
- [Low] After writing BMCR_RESET, rtl8152_set_speed() polls BMCR for up
  to 50 x 20 ms, but the new loop stops on the first failed read: `if…

--

r8152: add TGPHY register access for RTL8157 and RTL8159

This patch adds a TGPHY command channel for PHY register access on
RTL8157/RTL8159 and routes ocp_reg_read()/ocp_reg_write() through new
per-chip rtl_ops.phy_read/phy_write hooks. The PHY accessors and helpers
now return int, and a number of callers are changed to act on a failed
access.

> - read_mii_word() reports a failed read as 0, because the MII library
>   takes the return value for register content.  A TGPHY timeout
>   returned as an errno would look like a BMCR with autonegotiation
>   enabled, and mii_nway_restart() would write it back; with 0 it
>   returns without writing.  -ENODEV for an inaccessible device is
>   still returned, as the writes that follow are blocked then.

[ ... ]

> Older chips are unaffected, as r8152_phy_read() always succeeds.

[Severity: Low]
Is this last statement accurate? A few paths also change on the OCP-path
chips.

In r8156_hw_phy_cfg() for RTL_VER_11, the 0xd068 PHY read now always runs,
and it runs before the MID_REVERSE test. Before, it only ran when
MID_REVERSE was set:

    ocp_reg_read(tp, 0xd068, &data);
    if ((ocp_read_word(tp, MCU_TYPE_USB, USB_UPS_CFG) & MID_REVERSE) &&
        (data & BIT(1))) {

rtl8152_set_pauseparam() now reads BMCR even when pause->autoneg is 0.

rtl_pre_ram_code() now returns the errno from rtl_phy_patch_request()
instead of always returning -ETIME. rtl_phy_patch_request() now also tries
a release on the -ENODEV path.

None of these look harmful. Should the commit message mention them?

In the read_mii_word() bullet, -ENODEV is only still returned by the
test_bit(RTL8152_INACCESSIBLE) check at entry. If the device becomes
inaccessible during the access, r8152_mdio_read() returns -ENODEV and
read_mii_word() turns it into 0:

    return ret < 0 ? 0 : ret;

Could the wording be changed to match the code?

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 2f3d97e2400c3..e6a5d35403a28 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -1822,7 +1866,10 @@ static int read_mii_word(struct net_device *netdev, int phy_id, int reg)
>  
>  	ret = r8152_mdio_read(tp, reg);
>  
> -	return ret;
> +	/* The MII library takes the return value for register content,
> +	 * so a failed read must not be passed on as an errno.
> +	 */
> +	return ret < 0 ? 0 : ret;
>  }

[Severity: Low]
With a failed read reported as 0, the MII library callers in
drivers/net/mii.c treat it as real register content.

mii_nway_restart() sees BMCR_ANENABLE clear and returns -EINVAL. On
RTL8157/RTL8159, a TGPHY timeout on that BMCR read therefore reaches
userspace as -EINVAL from rtl8152_nway_reset() (ethtool -r). The same
happens in rtl_ethtool_set_eee(), after eee_set() has already written the
EEE registers.

mii_ethtool_get_link_ksettings() returns void. With BMCR=0 it reports
AUTONEG_DISABLE with SPEED_10/DUPLEX_HALF, and BMSR=0 gives SPEED_UNKNOWN.
It also overwrites mii->full_duplex.

In rtl8152_get_link_ksettings(), the new OCP_10GBT_CTRL/STAT reads
propagate the error. If only the MII library reads fail, though, the
function returns 0 with made-up link settings. Is this split intended?

The commit message explains the 0 mapping for mii_nway_restart(). It does
not mention the misleading -EINVAL or the get_link_ksettings output.

[ ... ]

> +static int rtl_tgphy_access(struct r8152 *tp, u16 addr, u16 *data, bool write)
> +{
> +	u16 cmd = 0;
> +	int ret;
> +
> +	ret = wait_tgphy_cmd_ready(tp);
> +	if (ret < 0)
> +		goto out;
> +
> +	if (write) {
> +		cmd |= TGPHY_CMD_WR;
> +		ocp_write_word(tp, MCU_TYPE_USB, USB_TGPHY_DATA, *data);
> +	}
>  
> -	return data & clear;
> +	ocp_write_word(tp, MCU_TYPE_USB, USB_TGPHY_ADDR, addr);
> +
> +	cmd |= TGPHY_CMD_BUSY;
> +	ocp_write_word(tp, MCU_TYPE_USB, USB_TGPHY_CMD, cmd);
> +
> +	if (!write) {
> +		ret = wait_tgphy_cmd_ready(tp);
> +		if (ret < 0)
> +			goto out;
> +
> +		*data = ocp_read_word(tp, MCU_TYPE_USB, USB_TGPHY_DATA);
> +	}

[Severity: Low]
For a write, the only busy wait happens before the command is issued. Once
DATA/ADDR/CMD have been posted, ret is still 0. If the busy bit never
clears for that write, the function still returns 0. The -ETIMEDOUT is then
reported by whichever TGPHY access comes next.

The commit message says rtl8152_set_speed() updates the cached
speed/duplex state only once the final BMCR write succeeds. When
PHY_RESET is not pending, nothing reads the PHY after that write. So
tp->ups_info.speed_duplex, tp->mii.full_duplex and tp->mii.force_media
are committed even if the PHY never took the write. SIOCSMIIREG in
rtl8152_ioctl() now also returns this status to userspace.

ocp_adv_write() uses the same posted-write pattern, so this may be the
intended hardware protocol.

Should the write path wait for TGPHY_CMD_BUSY to clear after posting the
command? If not, should it be documented that write success only means
the command was issued?

> +
> +out:
> +	/* A failed control transfer latches RTL8152_INACCESSIBLE */
> +	if (!ret && test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +		ret = -ENODEV;
> +
> +	return ret;
> +}

[Severity: Low]
Is this comment true for every failed transfer? r8152_control_msg() returns
-ENODEV early, without setting the flag:

    if (ret == -ENODEV)
        return ret;

generic_ocp_read() and generic_ocp_write() then call rtl_set_unplug(). That
function only latches the flag once the USB core has marked the device
detached:

    static void rtl_set_unplug(struct r8152 *tp)
    {
        if (tp->udev->state == USB_STATE_NOTATTACHED)
            rtl_set_inaccessible(tp);
    }

get_registers()/set_registers() can also return -ENOMEM on an allocation
failure without touching the flag.

In these cases a DATA/ADDR/CMD write can be dropped, or the final
USB_TGPHY_DATA read can return 0xffff. For -ENOMEM it can return an
uninitialised value from the local tmp in ocp_read_word(). Either way,
rtl_tgphy_access() still returns 0.

This is no worse than the OCP path. Still, do the comment and the commit
message ("returns an errno (-ENODEV if the device is inaccessible)")
overstate what is detected here?

[ ... ]

>  	if (bmcr & BMCR_RESET) {
>  		int i;
>  
>  		for (i = 0; i < 50; i++) {
>  			msleep(20);
> -			if ((r8152_mdio_read(tp, MII_BMCR) & BMCR_RESET) == 0)
> +			ret = r8152_mdio_read(tp, MII_BMCR);
> +			if (ret < 0 || !(ret & BMCR_RESET))
>  				break;
>  		}
> +
> +		/* The new settings are already applied and cached. */
> +		ret = 0;
>  	}

[Severity: Low]
Does a single failed read here end the reset wait early? On
RTL8157/RTL8159, a TGPHY -ETIMEDOUT breaks out of the loop as if
BMCR_RESET had cleared, and ret is then forced to 0. Callers such as
rtl_hw_phy_work_func_t() then continue PHY setup while the PHY may still
be in reset.

r8153_phy_status() in this patch treats a failed read as not ready and
keeps polling. Would it be more consistent to stop here only on -ENODEV,
and keep polling on a timeout?

The commit message says a failed read is not reported. It does not say
that the read also ends the wait.

[ ... ]

> @@ -7240,8 +7480,13 @@ static void set_carrier(struct r8152 *tp)
>  {
>  	struct net_device *netdev = tp->netdev;
>  	struct napi_struct *napi = &tp->napi;
> +	int bmsr;
>  
> -	if (r8152_mdio_read(tp, MII_BMSR) & BMSR_LSTATUS) {
> +	bmsr = r8152_mdio_read(tp, MII_BMSR);
> +	if (bmsr < 0)
> +		return;
> +

[Severity: Medium]
Can this lose the link change event? rtl_work_func_t() has already
consumed the flag before it calls set_carrier():

    if (test_and_clear_bit(RTL8152_LINK_CHG, &tp->flags))
        set_carrier(tp);

On a link down, intr_callback() has also already stopped the queue:

    if (netif_carrier_ok(tp->netdev)) {
        netif_stop_queue(tp->netdev);
        set_bit(RTL8152_LINK_CHG, &tp->flags);
        schedule_delayed_work(&tp->schedule, 0);
    }

Suppose the BMSR read then times out on RTL8157/RTL8159 in
rtl_tgphy_access(). Neither the netif_carrier_off() path nor
netif_wake_queue() runs, and RTL8152_LINK_CHG is not set again.

The netdev then keeps the carrier on with the TX queue stopped. This lasts
until another interrupt shows a mismatch, or until the TX watchdog calls
rtl8152_tx_timeout(). A link up can be missed the same way.

Could this error path set RTL8152_LINK_CHG again and reschedule
tp->schedule? The LINK_STATUS branch at the end of set_carrier() already
does that.

>  	if (bmsr & BMSR_LSTATUS) {
>  		if (!netif_carrier_ok(netdev)) {
>  			tp->rtl_ops.enable(tp);
>  			netif_stop_queue(netdev);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126033211.51850-1-nic_swsd%40realtek.com
