Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4702D36A340;
	Mon, 13 Jul 2026 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929291; cv=none; b=IWHcrGKGL2UkVTYh2ZgGeN2bhcwy1TZ9rxkcb26W8RjDiThMEEKslqo34ogsTNIfq/xvkRW01j5s5fLFk1qobkihqvTJ2Ruck9FTo6/GW9NGhA3IYTVdYVhj62mBaEObIqysVKUwVTGuDKR3JdRaPOoFf44zrXiYgRXMkft3eCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929291; c=relaxed/simple;
	bh=lM9RDyno9COxCClK3eYnUEF7Qp5IU6t2XciFZ2RhFS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYCymwS01PzLE01DI/wX2Q/w7CRI1RsKEmlDOoePMzi5CtqSstIr9N3lvKDmPDjyT9Owq99+PnqyIkF1GZycZkZ/aayRj2WDzC4HhTcJcE7BWpNY5Z6CiRTLxYDToTHjLslB4xplSmp0Iz+zjbU8l4SEZP111NDWg3a4XK+aYfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ApLcwtXr; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ApLcwtXr"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 779A320F54;
	Mon, 13 Jul 2026 09:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1783929278;
	bh=LIMSoCoPn2TvHqW5r2HbTFAy2cTbWv7M6EsJ8hb+heU=; h=From:To:Subject;
	b=ApLcwtXrm8U1o5X/EgwHOMc7zNkFNLRtXPDx3p9Pmjkswik6fqocWfMsce+TXw/st
	 QWmo7nafkhY0YvDwtY71mGoHsYO1GznCZqlgQa4J2RWKLiSGalHUE1w6CFEM790w06
	 /ZhSyqAlIQsruRBsU+bA80r79DE9tS2tliGLuFe/N1ryrtSQ5+RwJmt+LEcLF+TeXX
	 SkUPUzmEiQRFlumW/1VgxJjdwC21PgKgHgDhfpiFcxY49sRnwyaFJCVLtG9wapFuiP
	 nT42Tr8HiVnKzuOEL1SJiiLSVllsG/zO3hcXjjiNdKfN+m52pCeeARsrHeI2aYReKf
	 eO3pP9uOEsJDg==
Date: Mon, 13 Jul 2026 09:54:34 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Franz Schnyder <fra.schnyder@gmail.com>, Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com, Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <20260713075434.GA32373@francesco-nb>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
 <5zz6yhc4ymoccovibmjlse2l2d6y3g3dwu5r5a677rplpfdnwu@fo2ed54hqzeh>
 <6btg6x2bsgu6jzzxds3koyha3ucaf37apbshhfgpu2vxdgb5oz@npvm7tkg3bxh>
 <25fqcu6itk47tvm4qto7zw2r4cno7kryxi7a6lo6ddbxwzbakx@nj3ytoy44ynl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25fqcu6itk47tvm4qto7zw2r4cno7kryxi7a6lo6ddbxwzbakx@nj3ytoy44ynl>

Hello Xu,

On Wed, May 27, 2026 at 02:33:05PM +0800, Xu Yang wrote:
> On Tue, May 19, 2026 at 10:54:58AM +0200, Franz Schnyder wrote:
> > On Tue, May 12, 2026 at 05:53:57PM +0800, Xu Yang wrote:
> > I've attached the logs below with and without the commit. looking at 
> > what happens before the warning I think the problem is that after probe
> > deferral the depopulate path races with the device link state changes 
> > from the fw_devlink cycle fixup.
> > 
> > One important thing to mention is, that we build dwc3 and typec as modules.
> > If I build them as built-in I can't reproduce the kernel warning so far. 
> 
> Thank your for the information.
> 
> It's indeed an important finding. I can reproduce the issue when I build the
> driver as modules.

Just a head-up on this

7.2.0-rc3 is not ok on this regard

```
[    6.285930] WARNING: /usr/src/kernel/drivers/base/core.c:1706 at device_del+0x2b4/0x388, CPU#5: (udev-worker)/409
[    6.285950] Modules linked in: ulpi(+) ehci_hcd amc6821(+) nvmem_imx_ocotp_ele tcpci(+) tcpm roles phy_fsl_imx8mq_usb usbmisc_imx ina2xx typec dwc3_imx8mp(+) lm75 imx93_adc spi_nxp_fspi i2c_mux_pca954x svc_i3c_master i3c flexcan spi_fsl_lpspi can_dev pwm_imx_tpm gpio_keys display_connector evdev fuse autofs4
[    6.286031] CPU: 5 UID: 0 PID: 409 Comm: (udev-worker) Not tainted 7.2.0-rc3-0.0.0-devel #1 PREEMPT
[    6.286039] Hardware name: Aquila iMX95 on Aquila Development Board (DT)
[    6.286044] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.286050] pc : device_del+0x2b4/0x388
[    6.286057] lr : device_del+0x1b8/0x388
[    6.286063] sp : ffff80008364b740
[    6.286067] x29: ffff80008364b760 x28: 000000000000000c x27: ffff800081347ea8
[    6.286078] x26: 0000000000000000 x25: 0000000000000000 x24: ffff000087ae28c8
[    6.286088] x23: ffff000087ae28c0 x22: ffff000080a6c010 x21: 0000000000400140
[    6.286099] x20: ffff8000814c8e60 x19: ffff000087ae2810 x18: 0000000000000000
[    6.286110] x17: 0000000000000000 x16: 00000000000017fb x15: 0003a7018ef1930c
[    6.286120] x14: 0000000000000225 x13: ffff800080d6f068 x12: 0000000000000000
[    6.286130] x11: 00000000000000c0 x10: 0000000000000a30 x9 : 000000000000003c
[    6.286141] x8 : ffff80008364b640 x7 : ffff000080001540 x6 : fffffdffc22a7600
[    6.286151] x5 : ffff800080232cac x4 : ffff00008001fe00 x3 : ffff00008a9d8280
[    6.286161] x2 : ffff000087ae28b8 x1 : 0000000000000003 x0 : ffff0000813fb800
[    6.286172] Call trace:
[    6.286177]  device_del+0x2b4/0x388 (P)
[    6.286185]  platform_device_del+0x2c/0xa0
[    6.286194]  platform_device_unregister+0x14/0x3c
[    6.286202]  of_platform_device_destroy+0xf0/0x100
[    6.286211]  device_for_each_child_reverse+0x6c/0xc4
[    6.286219]  of_platform_depopulate+0x34/0x80
[    6.286225]  dwc3_imx8mp_probe+0x268/0x3f0 [dwc3_imx8mp]
[    6.286241]  platform_probe+0x80/0xac
[    6.286248]  really_probe+0xc0/0x3e0
[    6.286255]  __driver_probe_device+0x164/0x1bc
[    6.286261]  driver_probe_device+0x3c/0x118
[    6.286268]  __driver_attach+0xc8/0x21c
[    6.286274]  bus_for_each_dev+0x7c/0xdc
[    6.286282]  driver_attach+0x24/0x30
[    6.286288]  bus_add_driver+0x11c/0x260
[    6.286294]  driver_register+0x68/0x124
[    6.286301]  __platform_driver_register+0x24/0x30
[    6.286307]  dwc3_imx8mp_driver_init+0x28/0xfdc [dwc3_imx8mp]
[    6.286317]  do_one_initcall+0x60/0x1d4
[    6.286327]  do_init_module+0x54/0x244
[    6.286336]  load_module+0x18a0/0x2040
[    6.286342]  init_module_from_file+0xd8/0xf0
[    6.286349]  __arm64_sys_finit_module+0x208/0x35c
[    6.286356]  invoke_syscall.constprop.0+0x48/0xe4
[    6.286364]  do_el0_svc+0xa8/0xbc
[    6.286371]  el0_svc+0x40/0x228
[    6.286379]  el0t_64_sync_handler+0xa0/0xe4
[    6.286385]  el0t_64_sync+0x198/0x19c
[    6.286394] ---[ end trace 0000000000000000 ]---
```
