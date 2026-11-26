Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684918;
	b=hDA/UNLidEwElCEWcB1S6C/m0Elc64dzCfcmGL3ni3B4FmFBzauiGIXD2Yw6DCa+3C4p
	 Cz4SFm6xDeGMIBey1Q7TqJsdFhGGH8ZpLU66h0ivJlpQpy2dxTV0QAbxlft2y4gjEWez1
	 gRPMbTqoq9/vOus9gM5RnrBX5fvE0witiNoxCRA+HpkCUxvHjvAOHEkSZ83ZX3XqEC0jv
	 NAceMvNNPMeOZYMPe+0BIFjn8jwzyX1COKQyANe5yOThsURhznvVN4l3upEwXSqujFCzW
	 HhwJ7Bs4KeEBzbdq441pH+2dg0Qj0uj9vWizXPcUdYeqV1uEr/8GNJCuRTSUYFhDg9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684918;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=WsVj4KD5V6xD96iJwBwjksOcEJnqev9LYjORmDnLPlc=;
	b=l7+IE5U5JYR3F7x9xurvM49/AnDPS1t6mSTDmtFOH63KHApP11btC9SVZLff5H0OHkTa
	 vADL/weMJ1SovK+o4tIY7ClW0UQqTFW6i1rn9aumRF6PpaQey/5KeFVxDhR+AQG6VsXiQ
	 1lLRHilU1FNy9FUm80a12LozuhxTDW2xf3Pkt2P7qlb4TBYJZpqwKHTFcJeKj8j1s4xnX
	 l+I/UI6RbCryQbfQChYLs0XgBH3wfSl+gmi98FhuBgrPaKVxeNSXZeOekFhxfgum7Ol99
	 wfSqojb+mFzmFsAAEFRp6GIIJgyv8bHEhz8Ge43NWvO4MapUV6JwFi7sez8pJagnKWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PvxhitGC;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2511B606A31C;
	Thu, 26 Nov 2026 09:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2511B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PvxhitGC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795684919; x=1827220919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/hUGbjPNZAXU3qQnNIV8GlX5cXk7v+mn0wYdmIzb0eU=;
  b=PvxhitGCLBSdQql6x26+WR68yGOJy4KfwTVvCrcQjm4uhWPSQMSJsvwt
   2e5CDI3mNsmbssZEG+6dBSZofkgFqjnv5sX0wpCYNPrjx4KNHjsHQ7Z4C
   6FaCEfAiSWaGXHufp4E1CiumtW+AT8eRLSDIwIMxQtS8+4M+2e1U382fG
   p+oyQQpgRwvJHdI1wU9crDxxXfGonuAfJo0xxCE67XGE/stPzst7ukebm
   mrGaRGgXDkejpWmf+qBt/bVlblSXtB4Q2969ipZHuc8QkGPBTkUXKpumr
   rI9NXvNJB/obyRglYoaitdP1/Dryv9vtpTn+cQoo0pNakJHJ3ulxESWas
   A==;
X-CSE-ConnectionGUID: jRUK6NNGT1ygBzP1x+S29Q==
X-CSE-MsgGUID: uNNwRd2ITpmhOQUxpsz1rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4498453"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4498453"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 01:21:58 -0800
X-CSE-ConnectionGUID: jqxrnSvsRzmWjcz3YEn4gQ==
X-CSE-MsgGUID: l+VlTFImRlOObP/9iDbUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12122503"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2026 01:21:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5CCAA98; Thu, 26 Nov 2026 10:21:53 +0100 (CET)
Date: Thu, 26 Nov 2026 10:21:53 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Message-ID: <20261126092153.GN191152@black.igk.intel.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-8-chunfeng.yun@mediatek.com>
 <20261124160038.GR229695@black.igk.intel.com>
 <269e96946472c8562657fa1b40f24a17ee52b447.camel@mediatek.com>
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
In-Reply-To: <269e96946472c8562657fa1b40f24a17ee52b447.camel@mediatek.com>

On Thu, Nov 26, 2026 at 08:48:54AM +0000, Chunfeng Yun (云春峰) wrote:
> On 二, 2026-11-24 at 17:00 +0100, Mika Westerberg wrote:
> > On Mon, Nov 23, 2026 at 07:36:54PM +0800, Chunfeng Yun wrote:
> > > When USB4 is woke up by device disconnect, no need wait for 2s,
> > > usually the phase2~4 takes at most about 200ms, and enters to
> > 
> > usually phases 2-4 take at most..
> > 
> > The 200ms is not from the spec though? It's empirical right on your
> > hardhware?
> 
> Yes, you are right. The ~200ms is empirical based on testing on our
> hardware with various USB4 docks and devices, rather than a hard limit
> from the spec.
> 
> In the USB4 spec, the lane adapter stays in CLd (TB_PORT_UNPLUGGED)
> throughout Phases 2-4 until it sends LT_Resume at the end of Phase 4 to
> enter Training (TB_PORT_CONNECTING), and the spec does not define an
> overall maximum timeout for Phases 2-4. At the protocol level, Phase 2
> (tConnectRx), Phase 3 (AT transactions), and Phase 4 (tLTPhase4 and
> Broadcast RT transactions) only take tens of milliseconds; in practice,
> the ~100-200ms delay mainly comes from partner router wake-up, re-timer
> initialization, etc.
> 
> So I doubled that empirical ~200ms to 400ms as a safety margin.
> 
> I will clarify in the commit message that this is an empirical value in
> v4. Do you think 400ms is fine here, or would you prefer 500ms to leave
> a bit more margin for active cables and older Thunderbolt switches?

This has been working fine so far so no need.
