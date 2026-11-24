Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536724;
	b=GbrMM/1TKbXB3wihs1xkBmECGY9Jf8Sb0odsrsCOzYOltEfvwp764NmqY0SyxIgg8YWM
	 ZpPi+wDt5XbZAxCjMLnBMcZFcPfrY1oOL7Bz2XOY9fKN5sJ618z8vasOIfpOOGVwxQCof
	 mIB96GAlAVBh57ExOekfWUa4cyWRex/I4MendVHVizjV0fdVmVla4GS26Shj0WtZiGTUY
	 CLG6EnEdXhS+5skrd2toM2jVKjScWFIYRflINvDdO0U6LgLOecYnbGJc81j9VCFRht8rP
	 bo7c/dHhxcbDH0qlIWDbhPUs5nJm37d1ovKYK0WuQQPsA38tfefJIdeuALS9yEOW+tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536724;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vQ6vW3sYbcgyOH9bAhfE5XUba6QBbadxNG/psr8B7AQ=;
	b=mSADMi0gRjKOsc7ogdU67C7bXPikPX+6mxy5V/HR/3zxnzNtllgF5VW429yyS7EhEEoE
	 US/SG6a4TD8PI1fytYtsZeYqMgOg+IWSL7XSGUdQOQKei+0Dkfum8wYvqeut3zyeqXXo4
	 uk1pU6mlQtqJNQF4803Po3Qeq6Sm0mS69IYsPth2vRgX+2+3YzZ5iFDiEMYUg0nIAHHdV
	 2xAbGEX2uAnmRND94HKNLB/AyjCRIAkxELzbOnijtZjJ0mmhS96+ECVl6KzScFo+dYeSd
	 mM5JtJ7Q8P2RxBRt1v1U2CWLec+xW0VSY5aSt7FyD/9zYEueUHyubA1OE5miMQKgV+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UqU8OnhN;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59758606A31E;
	Tue, 24 Nov 2026 16:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59758606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UqU8OnhN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795536725; x=1827072725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8jNXelQh+v0UQsg1z1NZYZFU+UF9jDOrLrEkTGht43Q=;
  b=UqU8OnhN4oEeu2wA8lCBiYUDDIBFq5OkRvGXcz8G9zDzdLwVfd5xkHfT
   6fMbuBlm1Z1R8Tq+A4B5rG7m20qg8Ptq0X0+Coaz4KuktWEYbK6EDIsKR
   ATloaLi5VByXsXte/0xhZ1X/nqpcEYv2xQ/61gqGDF/qB7dvqjx6rTgNY
   wPGqWZKwq7jDVZOosl+XBjZPcfRmo5XMlyycsrSqNV2CC9ZEOvKJWhSG+
   Kk6qkOZ270+oZtTbzqugAxAhVQ/6i/sp8Wm8fXcUuv/4sAPP0ttnp4w9H
   4sC4+m0SWci6wuBhl4C+jUwhp3H6YNbbpjkBpILxoKmeCLIzI5CW+/9A/
   w==;
X-CSE-ConnectionGUID: eKnxMEnlSAK4uPL4ApE/og==
X-CSE-MsgGUID: 2/l1+YSkSoSk+FIB1ebpNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4295121"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4295121"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:12:04 -0800
X-CSE-ConnectionGUID: FH2dgkoDSi+u1P9aQStNLg==
X-CSE-MsgGUID: PVd8xENCQ86iO+qjC6OoJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11946919"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2026 08:12:01 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0321C94; Tue, 24 Nov 2026 17:12:00 +0100 (CET)
Date: Tue, 24 Nov 2026 17:11:59 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/8] thunderbolt: Prefix NHI core functions with tb_
 and tb_ring_
Message-ID: <20261124161159.GT229695@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-2-chunfeng.yun@mediatek.com>
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
In-Reply-To: <20261123113705.2297329-2-chunfeng.yun@mediatek.com>

On Mon, Nov 23, 2026 at 07:36:48PM +0800, Chunfeng Yun wrote:
> In preparation for modularizing PCIe NHI support and allowing PCIe
> and platform NHI drivers to be built as separate modules atop the
> Thunderbolt core framework, several NHI functions and structures will
> need to be exported.
> 
> Currently, several of these functions lack standard subsystem prefixes,
> risking namespace pollution or collisions across the flat kernel symbol
> namespace:
> 
> - ring_msix() lacks any subsystem prefix and diverges from all other
>   exported ring functions in the driver, which use the "tb_ring_" prefix.
> - nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard "tb_"
>   prefix used across the Thunderbolt public interface (such as struct
>   tb_nhi and struct tb_nhi_ops).
> - nhi_msi() is named after PCI MSI, even though the ISR simply schedules
>   the interrupt work and can serve as a generic ISR for non-PCIe platform
>   controllers as well.
> 
> Rename these functions and symbols to conform to Thunderbolt subsystem
> naming conventions before exporting them:
> 
> - ring_msix       -> tb_ring_msix

I think we can move MSI-X completely to pci.c. As far as I can tell ARM
stuff is not going to need that. While there we can drop MSI, that has been
never used (MSI-X was supported from day 0 by the HW).

Then I would just make the glue driver to pass ->irq to the core driver and
if that's set it does the request_irq() and so on. And PCI side does not
fill that because it uses MSIX always. Then we don't need to export the
interrupt handler functions either.

> - nhi_msi         -> tb_nhi_isr


> - nhi_probe       -> tb_nhi_probe
> - nhi_shutdown    -> tb_nhi_shutdown
> - nhi_pm_ops      -> tb_nhi_pm_ops

These are good.
