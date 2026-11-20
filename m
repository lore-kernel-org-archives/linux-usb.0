Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187598;
	b=Y3fAfNjAKamyMpll6yyDWY2VNf5E5crRRRwZ9cCLeiJ2EGx7YQuqi9A4+FOK9zYqQfyF
	 QUpfwMA77HLZMVT2YLkiuS3WAdQauHX52dBvsh93ZEnYg+/LuWeJ2YuKpuexQBnPfgD66
	 tDM9N4vLzNsG9BIbFkYvJPdZ+Ek2gtR9zivOwEaZJE2afy5FF4EPvaisSLKMmXIxPZc2J
	 /MqqTaFGifY+Ou6M8SZ2oHGuquNiAJI0G//QFoJ224N3Ati7EBrpEb20YwFmvEQ73DZAm
	 PeuJYek5hWKmIb6Dmn8RMLHt1CYA2Y82hQhDbIQ4xd3bGouRTcD8hKXSlKnUsDSoNzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187598;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ABRvRsqb42na7fmBTaQY+iGr9oRHDJKJkklTmXyDUG4=;
	b=mFQukaGEJn6uusSrAHzAC5DFFs+vO/jkQ9ueQqq59UZQI/3h4hmDvXQwnZ3+DWlIrDLq
	 Hr++s+k0PBNbaAC5WOFnjVak6TAuLzIhnvC/yo7rSC/r2KwrJH706ZVWBouPdkDACPv7u
	 FF8WBAAhAFzmTzyIGMlCohmDg7++a3BkTNpopyFl4FuMo4YntgCB79phVQ6v8fxndjkHn
	 29UmdNo3UxrmpLDf2QxfPipfzMSBPTe3GfpBvIXj7D2vW7hCxpsExNChQ/lRuCk7kfUA8
	 XuocK5+1YX5dxPYrVLAknnxBaAxrFWOpG0sLvPIlNjx/60zGuKch/j2HAyaCNC1W9uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NkQzQCeb;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE22606A32C;
	Fri, 20 Nov 2026 15:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE22606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NkQzQCeb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795187597; x=1826723597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nBybY+mm58R4cLIzCPF579m72gYMy/tJ9b8Yv4cm2tE=;
  b=NkQzQCebnbg/XP4M/B03qPjydpWJnHB/X919AAFuZvrhPKE8K8BEnE5E
   wxwN9aqiwoOLdSROwyDSD4lbySm6AKH5C+nvzNQ9qRYLlpz+230R9dlRi
   dHWNUE8SpG69ZpXcCFG/wDmj0zpC1djiRgcZWZTd79NnsJ/VJlmZkXgXz
   6Vph+PqzyKpxHXeUiRlbDdGC3mbLAL6HZlvofuTZE7vsA7/ypx/I0V6f+
   M43033hX7NT4lHWiq9xOio0PemaoQcY1ZjKzVaC196BqjWfqoywqF17SF
   LEmuxcN90xLSwk5rWVOudyEdXTmJQ+isSqJI2JCFWu7nq2t8RAZPBRc54
   A==;
X-CSE-ConnectionGUID: cQ1S3zeGR1+3YtC4jpxKlw==
X-CSE-MsgGUID: oHmW2Nb6RCCYMMevRsyCDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4109400"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4109400"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:13:14 -0800
X-CSE-ConnectionGUID: qt24WU2CTxqDDHmhk03lbQ==
X-CSE-MsgGUID: gorKGy3STj263KeKLrYKZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11052191"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2026 07:13:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 7F0E299; Fri, 20 Nov 2026 16:13:11 +0100 (CET)
Date: Fri, 20 Nov 2026 16:13:11 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Keep interrupt flags across a
 failed register read
Message-ID: <awBjhxTQmoj-MzHq@black.igk.intel.com>
References: <20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net>
 <awBFWmpR9hPkcerN@black.igk.intel.com>
 <CAKTNdwES7sRRDjvgFdGttesY9dppOkfBjNhwsJuwUWN1T9DFvA@mail.gmail.com>
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
In-Reply-To: <CAKTNdwES7sRRDjvgFdGttesY9dppOkfBjNhwsJuwUWN1T9DFvA@mail.gmail.com>

On Fri, Nov 20, 2026 at 05:52:45PM +0400, Alexey Charkov wrote:
> Hi Heikki,
> 
> On Fri, Nov 20, 2026 at 5:04 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Hi Alexey,
> >
> > On Tue, Nov 17, 2026 at 12:25:31PM +0400, Alexey Charkov wrote:
> > > Reading INTERRUPT, INTERRUPTA or INTERRUPTB clears its flags in the chip,
> > > so bailing out on an I2C error in a later read loses the flags already
> > > read. On Flipper One, a NACK on INTERRUPTB just as a source raised VBUS
> > > lost VBUSOK. The driver kept treating VBUS as off, so TCPM never attached
> > > as a sink and left every Source_Capabilities unanswered.
> > >
> > > Keep the flags pending until they are handled, and retry the reads a few
> > > times, as such errors pass. Otherwise a flag left pending waits for the
> > > next interrupt.
> >
> > I did not quite understand this. What's the i2c error? Shouldn't the
> > i2c adapter driver take care of the retries?
> 
> Any I2C transactions can fail - that's why the accessors return status
> codes. And they do, e.g. if another device on a shared bus misbehaves
> and hogs the bus down, or if there's any intermittent interference,
> etc. The I2C controller won't rerun the failed transaction and will
> propagate the error code to the caller instead. In my case it was
> -ENXIO when another device on the bus interfered with reading the
> interrupt status registers midway, causing the irq_work function to
> exit early and drop the flags it has already read without acting on
> them. The result was a permanently desynchronized TCPM state machine
> vs. what the partner saw on the wire.

Okay, got it.

> > > Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
> > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >
> > No stable?
> 
> Cc: stable would make sense; my oversight. Thanks for spotting that.
> Shall I resend with it added?

Yes, please send v2 with it added.

Thanks,

-- 
heikki
