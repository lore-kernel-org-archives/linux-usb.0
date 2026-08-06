Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3571A682C;
	Thu,  6 Aug 2026 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999781; cv=none; b=fiu0c7J0vOnwD25vFCM3EaGBEHZ5czydEnxmFK71mh1RntdJdDOmZH5wGwRsw6WGeo9hagUl/ECuqYEyaLkGAvd+ltwj5g+4oG3tKLN9uoSsO8mD9RlfpMGu/Ua1ysyUen6o2AM2kL7L2YI8DFYla9BXCsHWztCqLNr7dQPM/XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999781; c=relaxed/simple;
	bh=IQfXRtcYf0xL3teECrHsF4YFPeJ2ZSOxgi8RaJwgZZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJrNyr9c2W8iQJNx3RGF+ycOcicPf+OvQK35hpTE3ZVLNFLKR5B0V8YnGzwp9FyGlbptd+kcTuAwYJSlsN0anJrNnnFUplv9cdYsNPxcaIH2+FGwmCVgOGOZZcr24G4R/MMlTi9dp61sqyZkkN8/VDa02nRNxcZbURtUoTCRU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IOslL54I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IOslL54I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577AD1F00ACF;
	Thu,  6 Aug 2026 07:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785999779;
	bh=IQfXRtcYf0xL3teECrHsF4YFPeJ2ZSOxgi8RaJwgZZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IOslL54Ij39YUZ75iJi9qQ+YerTH+e1PSUakw0jhP4uzWy+8SeV/PzWDr73glZNaA
	 6jUSUygHJdd4qxWTrwclajPXChJmHKffdF0xirolSYpI4y5ri3N3188A/HaiB8TCvF
	 36fT3VimjLQSqOJzyMzi8xCzrKkHF24YVS/IHxGA=
Date: Thu, 6 Aug 2026 09:02:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: phucduc.bui@gmail.com
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER from
 IRQ lookup
Message-ID: <2026080623-repressed-griminess-e3fe@gregkh>
References: <20260806065254.28204-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806065254.28204-1-phucduc.bui@gmail.com>

On Thu, Aug 06, 2026 at 01:52:54PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>

All lower case?

> Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
> re-probed when the interrupt resource becomes available instead of
> continuing probe without an IRQ.

How was this found and tested?

thanks,

greg k-h
