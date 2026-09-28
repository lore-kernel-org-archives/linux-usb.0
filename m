Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770DB30FF36
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587522; cv=none; b=DEDP4Eg3upXt1OsWAecmxEf0C5ygYjNmwK6N6sK2IegGELV/6RJ3RqU6xMEc1YyBti95lvC3ZaQz9OtrscyRnVMNyXhf2TwwWBiQrDY5bEhklNGW5zyvh2L/Rz4Vg+lm8+nXmK9YXUSgQXa7Ez086v6EFk4b3qsZmg88DaPqKjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587522; c=relaxed/simple;
	bh=sRD9ofnlXZkewc41XWvNYzZyylkdw1BZP+frC5NLTO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP4WufdlccgAFIBWsHmqLTftmVzuw363TAyFamzU03mUvWQiVZa4GHCH8x+0CzZL2AcJGRm1Zp1Rs1TPNUhantObMuekd60ZWW9yUS39z6LYyDDsx0EEGAfJw9zbCD/gmuw+wTaFbbXpLrEdu8VdkEYFi/qdUkqNjL2jkfc6mTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kReiAaDI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kReiAaDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790587521; x=1822123521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sRD9ofnlXZkewc41XWvNYzZyylkdw1BZP+frC5NLTO4=;
  b=kReiAaDIvHxDcPDEsmW1E41lnIbW5b1x8SAyknundxk4BjecC62aqMfT
   VPK7ynTOZqYC8c3YIhSAl1Xh8sbWRxZaOWsh6BJV9KeNQthHhFhrIJVJ3
   siYm/VX1fp9ygB4oCRYxlnPatemNprizMkUb8uCvMrn90IYs6tgbRZATb
   ghWWSRB6JaTXWXtmnOSH2Cz4hbNSPfL1I/GFx++ho9vrbmunL/t76wE8j
   pmZld4w0yGcKm1VZJol9FAgR38RMo0t7QtlJiZLEQRsigLnmEQ7TZSNgS
   n3p4B06hLgi3zgW7TnQwTJTUdGkwsveug5EHbtDO9P61SR0UnaBDZCW4U
   w==;
X-CSE-ConnectionGUID: toWD0sJ2SL+da5Qhb3AJGA==
X-CSE-MsgGUID: f2fn6JhdQ9S/PIipDOmDwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="78845892"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="78845892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 02:25:20 -0700
X-CSE-ConnectionGUID: V5EKJ6JSSHeBXHeQeeEViw==
X-CSE-MsgGUID: hTNwOyzERTqZXDfWWtUvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="283078687"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 02:25:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 59C1899; Mon, 28 Sep 2026 11:25:17 +0200 (CEST)
Date: Mon, 28 Sep 2026 11:25:17 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kurt Lieber <kurt@lieber.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Message-ID: <20260928092517.GE106095@black.igk.intel.com>
References: <20260924101046.GN106095@black.igk.intel.com>
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924125729.GP106095@black.igk.intel.com>
 <SJ0PR15MB469651A447568D8E66757EB1A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924145447.GR106095@black.igk.intel.com>
 <SJ0PR15MB4696FC97236D81E59D40E142A3802@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260925050124.GT106095@black.igk.intel.com>
 <SJ0PR15MB46968FAE6C8D0A6A250C5ACBA38F2@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260926102705.GD106095@black.igk.intel.com>
 <SJ0PR15MB46961EF9154F8795B63E66C7A38F2@SJ0PR15MB4696.namprd15.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ0PR15MB46961EF9154F8795B63E66C7A38F2@SJ0PR15MB4696.namprd15.prod.outlook.com>

Hi,

On Sat, Sep 26, 2026 at 11:37:09AM +0000, Kurt Lieber wrote:
> Hi -
> 
> On Sat, Sep 26, 2026 at 10:27:14AM +0000, Mika Westerberg wrote:
> 
> > This is the smoking gun! Thanks for taking the dump from the other side as
> > well. CM guide actually says we cannot enable CL states if this bit is not
> > set. Can you try the below patch (without clx=0)?
> 
> The patch works here with thunderbolt.clx left at Y.
> 
> linux-omarchy 7.2.5-4. I built your change into the 7.2.5
> thunderbolt module (usb4_port_clx_supported requires both
> PORT_CS_18_CPS and PORT_CS_18_CSC; the function tests mask
> 0x800400) and loaded that module with the clx=0 option not
> applied. The Anker Prime (DROM 01ea:83b5, NVM 62.2) disconnected
> when the old module unloaded, then came back once:
> 
>   thunderbolt 0-3: new device found, vendor=0x1ea device=0x83b5
>   thunderbolt 0-3: Anker Prime Docking Station (14-in-1, 8K, Thunderbolt 5)
> 
> It stayed authorized at 40 Gb/s (2 x 20 Gb/s). For the next 15
> seconds dmesg had no "TMU: failed to enable mode uni-directional,
> LowRes: -107" and no further thunderbolt disconnect. The dock USB
> devices enumerated and stayed.
> 
> So the patch is successful, I believe.  Thank you for puzzling through it.  Let me know if there's anything else I can do on my end.  Cheers!

Thanks for testing! I realized now that the host side shows the CSC bit 0
because that was added in USB4 v2 so the v1 host does not know about that
bit and that's why we see different values between the ends. So the cable
supports it, the host supports it and the dock (well BR) should support too
but we don't know if there is something in the Anker firmwares like the
PD/retimer that could have issues with CL states. 

I'm going to apply your quirk instead.
