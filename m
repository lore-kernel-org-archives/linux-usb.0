Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94988233939
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 16:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097340; cv=none; b=ZR39DsDt/V3xsKeXIWYkNrgpoTt4QpvlxedXGVsmg4jl5DvlnJ7VwfBR7ylU7xtITL10TMtC5VDEKSEZ6GwoI381vC2obY7d/5SDqeDqL7untzYizHSHCQ2cVbyx843wqS/xNw4UgYp1H7hezWp8H5+j6Tgoyc+MuOySwhE6vnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097340; c=relaxed/simple;
	bh=91MbmVvKWFm2Ng7MD89+haPWOwx3a/XRl3LTah2aL4w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Te2r5SdOVUUOXLdq3kdCAC6z6fIWXSHWPO5bl2bJilDEyAFGFwtCn0Evo8QzbuCDqQEVXxFO2mIMOFqx46noWE2L05Dez4laqLcWeTBu0tupYZdGKTAQHVooFHs8CozANY5Es1bl0D9mygHEFcaDMmP6nVv55aLRBcwVRO48diY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f08EljTC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f08EljTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783097339; x=1814633339;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=91MbmVvKWFm2Ng7MD89+haPWOwx3a/XRl3LTah2aL4w=;
  b=f08EljTCxsq5FWDjxglpu/4cOerby6SQ42PpdXRotvI4BUJKVoWZTqvU
   ft+RvIy2vslKGu59aslCyqrdzaeDgtr/heZYOzOJgZqbb9/WKWWr+Wr9A
   2TAkuIyvaS/ir2FIfqiSDUibl/Cebi4PFn9Hf9FzJvKWAE//MhyzsXGnc
   Y5uOi535phIPeN/NIJQxX0m6j2KDxWtfC2gSonQfeH2hL5BVbtvIej1YC
   S/arIABzPAeRRt7QBuLCMa/+XTAo0R/mZnGsyZWP54jamr1C2G8CgJ/+/
   +sxNiKOlTJR5dJGaW+ITYVZx++9wN6pDJ3PsHgcwDa1CRYLzbh5VlIhz9
   g==;
X-CSE-ConnectionGUID: jPVdwPhJRJGBv/t9Zb7/tw==
X-CSE-MsgGUID: ElzQIubESPWbFbigF2tIQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94210444"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94210444"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 09:48:58 -0700
X-CSE-ConnectionGUID: sn28lwtkS3usX1IfwMiXsw==
X-CSE-MsgGUID: u43qSb30QcKPvXNOED5gng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="277478086"
Received: from aborzesz-mobl3.igk.intel.com ([10.237.140.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 09:48:56 -0700
Message-ID: <e488a87aa3bf3e7dc53e8b9b2533ee8c6760a86a.camel@linux.intel.com>
Subject: Re: [PATCH RFC] thunderbolt: Add JHL9580 Barlow Ridge (TB5) ICM
 support =?UTF-8?Q?=E2=80=94?= host_reset timeout blocking PCIe tunneling
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: Neo <liqys@vip.qq.com>, linux-usb <linux-usb@vger.kernel.org>
Cc: "andreas.noever" <andreas.noever@gmail.com>, westeri
 <westeri@kernel.org>,  YehezkelShB <YehezkelShB@gmail.com>
Date: Fri, 03 Jul 2026 18:48:54 +0200
In-Reply-To: <tencent_B67BF923C66EC476F99F9C250FDA68D3B205@qq.com>
References: <tencent_B67BF923C66EC476F99F9C250FDA68D3B205@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Please send full dmesg with 'thunderbolt.dyndbg=3D+p' parameter in linux
command line.

Firmware Connection Manager (ICM) is not used with Barlow Ridge, only
software CM.

On Fri, 2026-07-03 at 11:49 +0800, Neo wrote:
> Hi maintainers,
>=20
>=20
> JHL9580 Barlow Ridge (8086:5780 bridge, 8086:5781 NHI), Intel's first
> Thunderbolt 5 / USB4 v2 host controller, has incomplete support in
> the
> kernel through v7.2-rc1. The host router reset times out and PCIe
> tunneling is non-functional, making eGPU use impossible.
>=20
>=20
> =3D=3D=3D Problem Summary =3D=3D=3D
>=20
>=20
> 1. get_upstream_port() in icm.c does not recognize Barlow Ridge
> bridge
> =C2=A0 =C2=A0(0x5780). Neither does icm_probe() handle the NHI (0x5781).
>=20
>=20
> 2. With these fixed, icm_firmware_reset() =E2=86=92 pcie2cio_write() time=
s
> out
> =C2=A0 =C2=A0(-110) on Barlow Ridge. Neither icm_ar_cio_reset (0x50/BIT(9=
)) nor
> =C2=A0 =C2=A0icm_tr_cio_reset (0x777/BIT(1)) work.
>=20
>=20
> 3. Without ICM firmware running, REG_FW_STS (0x39944) is read-only
> and
> =C2=A0 =C2=A0writes are silently ignored. USB3 tunneling works (XHCI pass=
-
> through)
> =C2=A0 =C2=A0but PCIe tunnels are never established.
>=20
>=20
> 4. Even with software CM (tb_acpi_is_native()=3D1), USB4 ports show
> =C2=A0 =C2=A0"link: none" and the eGPU GPU never appears in lspci.
>=20
>=20
> =3D=3D=3D Hardware =3D=3D=3D
>=20
>=20
> =C2=A0 Host: MSI MS-15M3 (E15M3IMS.117 BIOS, 2026-04-17)
> =C2=A0 CPU: Intel Arrow Lake-HX Ultra 9 275HX
> =C2=A0 TB5: Intel JHL9580 Barlow Ridge [8086:5780]/[8086:5781] (rev 84)
> =C2=A0 eGPU: GIGABYTE AORUS RTX5090 AI BOX (USB4)
> =C2=A0 OS: Ubuntu 26.04, kernel 7.0.0-27 (same issue on 7.0.0-22)
>=20
>=20
> =3D=3D=3D Patch Attempted (works up to firmware start) =3D=3D=3D
>=20
>=20
> --- a/drivers/thunderbolt/icm.c
> +++ b/drivers/thunderbolt/icm.c
> @@ get_upstream_port():
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82case 0x5780: /* JHL9580 Bar=
low Ridge Host Bridge */
>=20
>=20
> @@ icm_probe():
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82case 0x5781: /* JHL9580 Bar=
low Ridge NHI */
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->max_boot_acl =3D ICM_AR_PREBOOT_ACL_ENTRIES=
;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->can_upgrade_nvm =3D !x86_apple_machine;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->is_supported =3D icm_ar_is_supported;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->cio_reset =3D icm_ar_cio_reset;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->get_mode =3D icm_ar_get_mode;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->get_route =3D icm_ar_get_route;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->save_devices =3D icm_fr_save_devices;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->driver_ready =3D icm_ar_driver_ready;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->device_connected =3D icm_fr_device_connecte=
d;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->device_disconnected =3D icm_fr_device_disco=
nnected;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->xdomain_connected =3D icm_fr_xdomain_connec=
ted;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82icm->xdomain_disconnected =3D icm_fr_xdomain_dis=
connected;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82tb->cm_ops =3D &icm_ar_ops;
> +=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=
=E2=80=82=E2=80=82=E2=80=82break;
>=20
>=20
> Result: icm_probe succeeds, firmware_start begins, but
> icm_firmware_reset =E2=86=92 pcie2cio_write times out.
>=20
>=20
> =3D=3D=3D dmesg =3D=3D=3D
>=20
>=20
> =C2=A0 thunderbolt 0000:04:00.0: timeout resetting host router
> =C2=A0 (REG_RESET HRR remains 0x01 indefinitely; extended to 5000ms, no
> change)
>=20
>=20
> =3D=3D=3D Questions =3D=3D=3D
>=20
>=20
> 1. What is the correct CIO reset sequence for Barlow Ridge?
> 2. Is the ICM firmware interface different from Alpine/Titan Ridge?
> 3. Are there plans to add native Barlow Ridge support to icm.c?
> 4. Should Barlow Ridge use software CM exclusively (skip ICM)?
>=20
>=20
> Full diagnostic logs, lspci, and ACPI DSDT excerpt available on
> request.
> Test hardware available for any proposed patches.
>=20
>=20
> Thank you,
> =09
> Neo
> liqys@vip.qq.com
