Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593283;
	b=2w4JqORcQf+OyXiFAckt4aX+rbCr0BnGp+CICbRq+C5Jce15DTpo4Q7Encpblc74zzMA
	 xTzlyOHucC7RH+XSYZT5Kz+3rINq8P13sMEmiItBnTqWlX/FfnJwmH5xSXGDzHc9z5yMB
	 qlDhsQ4BtIHnzWhZZKReL1Wi3tP4fQfy7rYgnfVLYKztGsalHCBSw+6EU55EHDZTkEpd0
	 Gs5QAPW3ZCytyQlm127pqEeUErw+cKCZdKvo18H6KhAceZosGJyYoJWqd/oHaVIhZaqz+
	 OqLXXHMPsXIU+NNdT7SpOcozR94Bbr98ntiGx2I2KGhE/2Sn4cMY/YdXpLMuxjir+Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593283;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=N+zg2SmIPuIv3WqrRSQHqJlDzfO6WaXsjjFjLcNJvss=;
	b=xTfXfpiwKmbp+ztJU2VVpMW/Slv7Mc+AmMq8H+ZeXqJbUTHr0tVC4122IMDxhaTJ9vog
	 HSNUdGo39StPGJ3wXrzZz3Vud0RT8n3ur573bv3WZ7x3Jubft0yhaxYLyNWHtfZ0JAwia
	 5okTOm8s04uLMyaBnOmlVkms+f2qiWUD3HxMjA9LngorX08BsnlGVlZX6aD/RQlCUfq5a
	 IKNbclCPCGluyOepgCa+SNf1Gaat9Fw2w0eeUuZBKfxmG8lV6qEvEpjhtYk1Lx+2SwOfK
	 DSzTP//20JYfV9e5fq0zz1SwSzVe/F8MJKwizRFQoHgyZIvotGalsUnRqa3Gu7qrHVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bXrYEyeR;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B20606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 07:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9B20606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bXrYEyeR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795593282; x=1827129282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=71ESC1rXt510ytx+OYhHNKCUSHn2ydCwn7dBIoMyLH0=;
  b=bXrYEyeRbVi4Xv1Dn6jVmNz9uqHEfJ8O/6lZjLCMRBojxJ+SuSiexkBS
   7J9sXehaaXbH9BaXng3OJx6ciKaCMXknNVXT+yY2GAL+dDv2WgeTIg9O6
   apNcmAkpru5ruETolGtqxCFy4EbmpAjrkqMVwb5rxAjQ+ncljIXgPxurG
   lEBI+4j9nRfv9DkqU8g7IC2R6glBd2xEx88q1XXDO+CK/KtincQJja+X/
   qqGEoriTfn0rcsfwiYXj06sxGriY9SuQ9qCchzNuSiVEFQhNjp082y/yN
   vfW1P/1Ovmzmtr4W2xCCOB3urOlthEHtH1ghL2WTRFvbi4FEpNXGsHi2U
   g==;
X-CSE-ConnectionGUID: oKis10SQSlSRwRbvIB5Odg==
X-CSE-MsgGUID: JkUh7fKXTbypsY0lf/5kjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4363382"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4363382"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 23:54:42 -0800
X-CSE-ConnectionGUID: gXAXwDPiTXq84Ig0kDVRBA==
X-CSE-MsgGUID: N297/SNQTMCf6FP9PSYQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11827704"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 24 Nov 2026 23:54:40 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 28EFE98; Wed, 25 Nov 2026 08:54:39 +0100 (CET)
Date: Wed, 25 Nov 2026 08:54:39 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: myitforce@mail.grokbot.com
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org
Subject: Re: [BUG] thunderbolt: DP tunnel to USB4/TB5 hub torn down
 immediately (adapter unplug) on Alpine Ridge host
Message-ID: <20261125075439.GC191152@black.igk.intel.com>
References: <2e4a3414-502c-41ca-9e60-00877dafc403@mail.grokbot.com>
 <010001a20f992959-23c40ecb-a2a8-453d-950f-69dcc3788f56-000000@email.amazonses.com>
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
In-Reply-To: <010001a20f992959-23c40ecb-a2a8-453d-950f-69dcc3788f56-000000@email.amazonses.com>

Hi,

On Tue, Nov 24, 2026 at 10:07:05PM +0000, myitforce@mail.grokbot.com wrote:
> Hi,
> 
> The software connection manager on an Alpine Ridge (Thunderbolt 3) Apple host successfully builds a DisplayPort tunnel to an Intel Barlow Ridge USB4/TB5 hub, then immediately tears it down after a hot-unplug event on the hub's DP OUT adapter. i915 never sees a connected DP connector. USB, PCIe tunneling and the Thunderbolt link stay up.

Barlow Ridge Hub is not Thunderbolt 3 compatible. This happens also with FW
CM (it even fails to create PCIe tunnel) so there is little we can do here
on software side unfortunately. If the router sends unplug to DP OUT we
must handle it in the CM.
