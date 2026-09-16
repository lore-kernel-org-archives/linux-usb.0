Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66464483A0
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 07:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545123; cv=none; b=WnM5ULJw2z/G3/93vsCR716aZRHPnxLJDchWC8C+nolJF0YGPrnfHkwsDy+pBy5DoXJ2dsOBIr7jgugi7dljFHzFbfs92YZOPHa8//RdXS25HptIp4XxW+mgzphsa9O9sIL1NgOjp0L7kNBwF7YxBMIojFyIGJFW1DudzyUnU+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545123; c=relaxed/simple;
	bh=4FG/Xgij6DWTgtTyRcwlUjd9tk8Jv8Tb+W5PoZfK25w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qnet1C8bLytcDCjrQ4Oc9sMSdJKgEj0Sb7kN5V0OmqmIg3utp8gbxjU9w4dXtL3dWT/MKN8C8rwnCIJYaLIMmSYu/qp+0B3ZR6cRphl4glXvUss6CAPDVNjPWeRuWvGzSTCrDbR8AuQ9OrRrFUf66xhg7yejQtitgbgMAL8dlPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ebu+b8dp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ebu+b8dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789545109; x=1821081109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4FG/Xgij6DWTgtTyRcwlUjd9tk8Jv8Tb+W5PoZfK25w=;
  b=Ebu+b8dpcsjm2UPT0aRWDR+mpBsXY0t7srw+u3rHo2dHS4ptOr4C3A+1
   FpUUIRb/qO41q9lo0s/d/3KSPymBBDdq7tPM4+njVuqpM0NHDjKW3EO/r
   +R86CJRxTGGJFB2RBO+ohIJfCOzIrPinCM8+4TTeg81jOo5xsyNzbaDJB
   nIQ5eHdaObQt3uMX5MmfpdztxYVH1Qx+mkwlYfflubICtFXyB4O82x7BD
   lNrUS5Dma2B0GoN6zfPcp6/o4vrjdpz05bL0bx4Ny+qnP7RQSmb6JHH0k
   vSequ0IYstbrnrXwYtFbRPE95q7fN5uWfbe2d5OTifn/KPHP0aUzdfEUF
   Q==;
X-CSE-ConnectionGUID: vAaGn4qPSIm+TPDU81pQAw==
X-CSE-MsgGUID: O5Q7sHbETh+SJOU+TSJcdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90050253"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90050253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:51:38 -0700
X-CSE-ConnectionGUID: 4rcALgDIR2K1XHF12AXfCA==
X-CSE-MsgGUID: uY1gS8CZR5aYhoPF3jnhQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271811515"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 16 Sep 2026 00:51:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B81AE99; Wed, 16 Sep 2026 09:51:35 +0200 (CEST)
Date: Wed, 16 Sep 2026 09:51:35 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Ben <benstaples10@gmail.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260916075135.GN106095@black.igk.intel.com>
References: <CANcA1gDByZBwvkHBi4Bin-eCzBpN31OHaNStbpi4vhTF-WOAPg@mail.gmail.com>
 <20260915041958.GE106095@black.igk.intel.com>
 <CANcA1gC3cEuuK1OJkeq44ZZ_7uZZN=ZDkOJH0L-ERUNQcgZ12g@mail.gmail.com>
 <20260915043845.GG106095@black.igk.intel.com>
 <CANcA1gDh9AKFOdzK+kfLieJByxN1kjFQpSiexKPjHyOY8YMVQA@mail.gmail.com>
 <20260915050515.GI106095@black.igk.intel.com>
 <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANcA1gDbddDkZAQr_O6njK4PvaDk6nnj+fPsrzigH132u0f0Ng@mail.gmail.com>

Hi,

On Tue, Sep 15, 2026 at 11:01:20PM -0400, Ben wrote:
> Hello,
> 
> I've tested the plug after boot method, and it seems like it is working to get
> the dock full resources and stay stable.

Okay.

> For the second question: 
> It appears to me like the dock's xHCI is showing up as a distinct PCI device.
> (0000:0c:00.0 Goshen Ridge) instead of tunneling. I've compiled together some
> evidence towards this from my investigation in attached md file. 

Your Thunderbolt/USB4 host controller is using firmware connection manager
so we have quite little visibility what it is doing. However, I know that
it follows the same "rules" as the Linux software connection manager and
only enables the device xHCI if the link is not USB4. So if you are using
passive TB3/4/5 cables you should get USB4 link and also active TB4/5
cables.

You can verify this using tbdump from tbtools [1]

 # tbdump -r 0 -a 1 -vv -N 1 PORT_CS_18

Look at TCM bit. If it is set then the link is TB3 and you get the
integrated xHCI for that reason. Of it is not set then something is wrong
and we need to investigate.

(or -a 3 depending on which port you connected the device, tbadapters -r 0
shows the active adapters).

[1] https://github.com/intel/tbtools

> Also, if it's useful I tried a cold boot with connected dock with pci=realloc
> as a boot option after gathering these captures. The control died in the same
> way as initially shared. 

Better not to set any non-standard command line options. They typically do
more harm if you don't absolutely know what they are doing.

In your case if this is a PCIe add-in card then it still requires proper
BIOS support for resource allocation and power management. Otherwise it
will not work as expected.
