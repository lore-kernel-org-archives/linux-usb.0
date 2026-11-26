Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696039;
	b=OuI4M5JiwWUArZVY3FYwEVjEiaU6C3rIGOgbNN0KAYUp2/uzWmq6RbQoxThFnPuXveWA
	 vIxmsLFVbxh6w0bkSnkKWwzral/427dbFwFuI4GfcuL7l/pA4Kqpzjjt0ehMFHbIFHlTz
	 CnOELFMzQ1kerL66/FpfhAF45XaQGnxMmBj041d2kfXm31cofWFuSHOPP61+VKYNs9fIt
	 rbnNQVFGB/ss/YkOe3EYd9Q97S4rrHqb6OS7zIey8qT6g+yyg/iIpLOFc2hawLAoC8qDf
	 vf2pV7t+CxNnFINqwI/NHM2Ukv1p2YzVCHF4lajfpvUyRNo3zqEII9gQxK8XmZcTaZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696039;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=T6x9wmlht/HxAWx+bWJnsDGapCiVHFh3asB/n9KJRSo=;
	b=SZ+DMod3kj/bYAuJPkjJ8NXCWwNY4jHW4E7SzQDRKNVHz8LgvtxCN/HGww1LPaeY6t6w
	 yPhBHgzDEo63EZPcktV0IK/0D5yxLprz7LByrOqDdofqaz0wpAjiyoiNOaSM8Gydzw20o
	 kc38TSmQChMWHDrHBmnA6vUJUh/WZ4RCBbq9dqRmXDIgH+cBdNgsh3ZCj6ynYIIxTrizM
	 PALg1CAcO4ZMrHvbnY07QlN0sYSpLVys65bZXNB9zQWv2Vu/db2Xw7C2r9CA3ZYK7X9uE
	 Bwy18EPMB0B52+dfa7C4l6GFEwdGw6PqaMYl9XxCaEjwok9NtOZO0sPFiHbAgPMSNdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Blu15Qrv;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1495606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:27:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1495606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Blu15Qrv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795696040; x=1827232040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MA4L9j6sGYC3bNTiW+QX5vS2mB7FX8c47PWkuquAyD0=;
  b=Blu15QrvUA+QzVaxoFVtAITIWd1D6ozC51XKmQOTOF7F12reTk3v4D1D
   +L5NXedM3gF1qhAQLuSE60NjqBj6P76nnCBvd0c5+ZTCnXq0iFbjdX33z
   k3vJUecIJkn+ML4U9gQupGndU4GWA7l7kmP0D00LvAPWiaNrxeGFdjS0+
   rNSUjUOE9WAeIfxMhJeQS+uTuZwV/GSMFyVf5GAmBSEC6fIH2BJkrhLLB
   VV0QG52bO3WztShsYu1K4RBcfszfUvfrxiPY5xDLzWyrF7NUv8p41RYH1
   0Xgw5jji9Ok5Ob1Vc9aIVUIGLgAMqE2CE9PPHQASpk8otL2IOYNLTHojG
   g==;
X-CSE-ConnectionGUID: 5a/YL1MvSkytCPBcTdgQuA==
X-CSE-MsgGUID: oMb3PDs0QvSdAgfoHfL2tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4493106"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4493106"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 04:27:18 -0800
X-CSE-ConnectionGUID: 3Hu8PXN1SxiIku5YvWlQVQ==
X-CSE-MsgGUID: Hu9ST4CgRYCOjkxfhoK63Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12051161"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2026 04:27:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9426E98; Thu, 26 Nov 2026 13:27:15 +0100 (CET)
Date: Thu, 26 Nov 2026 13:27:15 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Achim =?utf-8?Q?L=C3=B6bbert?= <aloebbert@gmx.de>
Cc: linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>
Subject: Re: [REGRESSION/BUG] thunderbolt: ASM4242 fails to restore DP tunnel
 after resume on Ryzen 8700G (7.4-rc4)
Message-ID: <20261126122715.GA953667@black.igk.intel.com>
References: <UCVQtIkrSxeOKGOgiChTpA@gmx.de>
 <20261126073108.GL191152@black.igk.intel.com>
 <y0Ed3XDFSA-_b1YnGjn2yQ@gmx.de>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <y0Ed3XDFSA-_b1YnGjn2yQ@gmx.de>

Hi,

On Thu, Nov 26, 2026 at 09:53:05AM +0100, Achim Löbbert wrote:
> > Can you provide full dmesg without anything non-standard, except
> > "thunderbolt.dyndbg=+p" in the command line?
> > 
> > Once the host router (well any router) is enumerated during resume it is
> > expected to send plug events to the DP IN adapters that are available for
> > tunneling. That does not seem to happen here but it would be good to see
> > the full dmesg first.
> 
> Hi Mika,
> 
> please find attached full dmesg log with command line changed as requested.
> Still have a black screen after resume, until a manual re-bind of 0000:71:00.

Thanks! I can see that the ASMedia controller does not send plug events to
its DP IN adapters at all. My interpretation of the spec is that it should
do that but I think we can fix this with something like below. Can you try
it?

I haven't tried on Intel hardware yet so if this works for you we should
still check for both AMD/Intel that nothing breaks.

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4db25062b5e5..964191a1e0ab 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3198,6 +3198,8 @@ static void tb_restore_children(struct tb_switch *sw)
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to restore TMU configuration\n");
 
+	tb_add_dp_resources(sw);
+
 	tb_switch_configuration_valid(sw);
 
 	tb_switch_for_each_port(sw, port) {
