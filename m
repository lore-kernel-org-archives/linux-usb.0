Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163207;
	b=M1DKVRTGMAGw7GyxjOt1DJjZIMTWFICJillr+OZJ6auMJEoVo0nHB/IwOGtVw3v13XxI
	 H8dzwlyOpIVlIDDPSNwBKad5BqH//SMD3EB0OCJyORPua/HXxJi3vHHN/oNHCenh+SXMM
	 CXvFMKsDNF9XaEC6F8qpo1kUtLyOM1SAKncWFZr/X7EMqbE/7v+7tlg1R9RKRdSME5quo
	 KnINHJ6CO81kroTNOz87NjUaFS+FRHW4XjkVZlIiEqF6FZau6ZUauRl7LbS50OWF+QxWV
	 FWwT7c2IRz7Y6qlJfy5FRiy4GpcYGhZmV9gXVV7tnQcQooE1a0z/ei7DNrSuYiIirvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163207;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=aV8jtS66Tt+1KtEPhn6QzwtWLg4RKOLbiueDjLgm9B8=;
	b=MZI/kJ/9r6deA+Tpn95X/UZDoRZCWFurlC8pnVGpCmCxJWhsmgzFP/NHQEyMLznbKqaQ
	 BOgXHAM6X5anDRyy/kFPyKzbV8TcdMW2ElkRwPuek1yGT8hLW11TW44bKFd+O9XgjOBPk
	 ZN8ncr4mhDz9thdeogtDfUBOPdB+FGCogyXFyDxL/xPqwhqzgPcYylTlFqqFfrB4rts8f
	 JPw3DEcQe037To395Qn+t9OfcS8GYJeCFfFzz3MijQgAOjxig0iVePUFm0oaifbpG/97p
	 xbOfb/LOx4C+ijBXgPDG+dmkfwSOfxqEOVb9ELU+exgjpGYPv2n/ZK5Wo9Uu+ANvShw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKo+RNWT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE80606A320;
	Fri, 20 Nov 2026 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GKo+RNWT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091C61F000C6;
	Fri, 20 Nov 2026 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795163207;
	bh=aV8jtS66Tt+1KtEPhn6QzwtWLg4RKOLbiueDjLgm9B8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GKo+RNWTBbECnl7ztHjJyXNwuCG7vyB8iV2U3YYG7U+do5cDoPmPsdnGuttViBrDE
	 8vvLJNEObbOgOFUoLma2I/pHKteMokeQRLjYMjIKoBl/cMq7wS2xzv9hc1BKEp65Pi
	 UePeSHjxMFqGcBjrq7TFkwPhjjalKwChgjJ1euFTM4nDv31QHdcYa9l0Z5BeL/uyFw
	 0v531AMxmI3PmIJjalsKkNJYninErCi3AbFEVAYDaW5wgZ64sW1jCMv4x2Y7ZNK2qM
	 We+efUDFUQPi5D/Hx2uAAIO1OVqe9Sa9ZrcBOUAoP9wR/FC4qUdUvr+kB+S1Ur0Mm0
	 1cZlQJ89zFA5g==
Date: Fri, 20 Nov 2026 10:26:41 +0200
From: "westeri@kernel.org" <westeri@kernel.org>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Message-ID: <20261120082641.GB833643@thinkpad>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
 <20261110143758.GC259790@black.igk.intel.com>
 <2807832e631dca98846d201b571f623210820268.camel@mediatek.com>
 <20261117125241.GA259790@black.igk.intel.com>
 <39fed6e12d60f439e0f07f3012d675f1c85d2b84.camel@mediatek.com>
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
In-Reply-To: <39fed6e12d60f439e0f07f3012d675f1c85d2b84.camel@mediatek.com>

Hi,

On Fri, Nov 20, 2026 at 08:16:27AM +0000, Chunfeng Yun (云春峰) wrote:
> > > +	device_set_wakeup_capable(nhi->dev, true);
> > > +	device_enable_async_suspend(nhi->dev);
> > > 
> > > these two line can be put at the end of probe.
> > 
> > I meant device_enable_async_suspend() it's not stricly required and
> > we
> > don't do it elsewhere so I would leave it out now and then add it
> > everywhere later.
> 
> I look at the PCI core code, seems it already enables async suspend for
> every PCI device during device enumeration by default.
> 
>  see: pci_pm_init() (drivers/pci/pci.c)
> 
> Unlike the PCI bus, the platform bus does not automatically enable it
> for platform devices, but for usb devices, usually enable it because
> the standardized tree topology with well-defined dependencies.
> 
> Due to we explicitly create dev-link with xHCI/PCIe controller devices,
> it is safe to enable it, then keep the same way as thunderbolt/pci.c
> does.

Okay works for me then.
