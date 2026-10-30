Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350488;
	b=O1cwz79b1z9WMyEwFKRmoCdOUy0pH+DiDhDdVfCoyXf9MwFQb4slw5O4jAKiIBrWMOk5
	 o17W1QoMWj88eYiOHjEL4hMtljRgiMAP/eyo4q4IUU5DTGlmoeBX/GtR7eZiVsSPFVaxu
	 qIXeEapiqzngQ8SeksqqxuSXBQ1d6sXK0u498cK9NLE6voHEn5yqiMaoQ2yF6DJwPTzle
	 nr1TRmhf9om3Yuom6alorWLOmLvDRBf8gGK5FGs6VcoIOxgkYff6jLVRvKX6HvVMOJOPF
	 fA69ptTgQjrxi6v0Cpxg6Q7h0BR/t5tLGnNVq4rSn1yDATB9/yrQUF7eyLIEsAvIvVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350488;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qxY6/jLhiYuvmDzV7sd0wpO1QwrRJTU99Tef5kbAWcM=;
	b=vUoDorprWCgTqU11rnc6fdxTze5I7g45w8YqRJJ0eMWd3kC3peMggu1S3IYuipOSfFwF
	 K+uOt8pWayzJ8Yn5KIJ5I9N5E86XVfmTRyHnRotcpuK+V6jjrYvPk2hSgJiX6jVsf5ED3
	 aHOLgR91un/oMW6eolc1tTFiwQ5Pa/Dxgu3odNM3sxVo/MEGa7Ml6MXQAnJ3O6Zf1Pyr1
	 LV5lJlw4KoAbu5/TbiOIh57bjOAy5fhJSq5kuHXNli5ZOAjqP+FDH0DKfy7ZFJf/uOr2G
	 weWvtO3p/TxjfjUoAFXutYBIotuiy3YF1KPiGnNArWd6YlF/KWWOqEj55I89MMQ6knw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+ywsiZh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3091A606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+ywsiZh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9203A1F000C1;
	Fri, 30 Oct 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793350487;
	bh=qxY6/jLhiYuvmDzV7sd0wpO1QwrRJTU99Tef5kbAWcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+ywsiZhSlIoSLjGfGjwlmIW6SbYaseoOF4POzRJ6Bg/Ieza433aZW/ZVBtailx7F
	 3NuhvDwuETqYXcPbG0tzAR07eNu/tO42Rv/Ezd4Hco4hMKHnAjS7PdyO9txWJFtcxo
	 twPIMnX0xElx1nVE/9MotzOrh4CI1Ep/b+qfgguIRGH1EOr45GoGrUPvrWhjfVpx9+
	 RHLyQaiFSRLYCDpDdn0WINtRwTRI8lkU0I6ucCMyTo41Hjf4JrbTM5lpUuWrDmc81C
	 ibRsDucomxLBm4kDRZe0FnA49B72RCJzT67So/++cM6CEhmc2o+6tsKTTASZhGDar1
	 9oAR9of09cr2g==
Message-ID: <sashiko-outbox-190720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] thunderbolt: improve usb3 adapter link up timeout
 value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261030082539.1208733-4-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-4-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:54:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] thunderbolt: stale 1-second timeout in tb_wait_for_port() kernel-doc
- [Low] thunderbolt: commit message misidentifies lane adapter timeout as U=
SB3
--

commit bc67946f50d0699b97b8acb535ee59b1d04143ab
Author: Chunfeng Yun <chunfeng.yun@mediatek.com>

thunderbolt: improve usb3 adapter link up timeout value

This commit increases the retry count in tb_wait_for_port() from 10 to 25
(raising the timeout from 1 second to 2.5 seconds) so that ports with slow
link training do not time out and disconnect during resume.

>     thunderbolt: improve usb3 adapter link up timeout value
>    =20
>     when plug into a usb3 device into usb4 hub's DFP to trigger usb4
>     driver wakeup, encounter usb3 link up timeout issue, then cause
>     usb3 hub disconnect:
>    =20
>     usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring =
port...
>     usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
>     usb4_hi NVDA8100:00: 0:4 <-> 1:20 (USB3): deactivating
>     usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:20
>     usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:20 to 0:4
>     ...
>     thunderbolt 0-1: device disconnected
>     usb 2-1: USB disconnect, device number 10
>    =20
>     Completes link training at ~1.48s and transitions to TB_PORT_UP after
>     change the timeout to 2.5s:
>    =20
>     In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
>     1000 ms. When add tPhase3 (100 ms), tPhase4 (100 ms), and retimer
>     transaction delays (tCmdResponse =3D 50 ms), the physical link is
>     allowed by spec to take 1200 ms to 1500 ms+ to complete initializatio=
n.
>    =20
>     here are two retimers in the link, if more retimers add it, need more
>     time
>    =20
>     Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

[Severity: Low]
This isn't a bug in the code, but is the commit subject and description
accurate in referring to a USB3 adapter link-up timeout?

Looking at tb_wait_for_port() in drivers/thunderbolt/switch.c, it requires
port->cap_phy and polls tb_port_state() for TB_PORT_UP (CL0). In
tb_switch_resume(), tb_wait_for_port() is only called on physical lane
adapters (checked via tb_port_is_null(port), which corresponds to port 0:1
in the log):

drivers/thunderbolt/switch.c:tb_switch_resume() {
	...
	tb_switch_for_each_port(sw, port) {
		if (!tb_port_is_null(port))
			continue;

		if (!tb_port_resume(port))
			continue;

		if (tb_wait_for_port(port, true) <=3D 0) {
	...
}

USB3 protocol adapters (ports 0:4 and 1:20 in the log) do not have cap_phy
and were only deactivated as a downstream consequence after lane adapter 0:1
timed out and the downstream router was marked unplugged. In addition,
changing retries in tb_wait_for_port() affects all lane adapter readiness
waits across tb_scan_port(), tb_switch_lane_bonding_enable(), and
tb_xdomain_lane_bonding_enable().

Could the commit title and message be updated to clarify that this increases
the physical lane adapter link-up timeout rather than a USB3 adapter timeou=
t?

> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index d22d8db8f8906..e7ee9639c54cd 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -500,8 +500,9 @@ int tb_port_state(struct tb_port *port)
>   */
>  int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  {
> -	int retries =3D 10;
> +	int retries =3D 25;

[Severity: Low]
This isn't a bug, but with retries increased to 25 (2.5 seconds at 100 ms p=
er
retry), should the kernel-doc comment immediately above tb_wait_for_port() =
in
drivers/thunderbolt/switch.c also be updated where it still states a 1-seco=
nd
timeout?

drivers/thunderbolt/switch.c:
/**
 * tb_wait_for_port() - wait for a port to become ready
 * @port: Port to wait
 * @wait_if_unplugged: Wait also when port is unplugged
 *
 * Wait up to 1 second for a port to reach state TB_PORT_UP. If
 ...
 * Return:
 * * %0 - If the port is not connected or failed to reach
 *   state %TB_PORT_UP within one second.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030082539.1208=
733-1-chunfeng.yun@mediatek.com?part=3D3
