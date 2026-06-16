Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EFF426D00;
	Tue, 16 Jun 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605491; cv=none; b=XxYBb5/eHhfwNAHAopcTuZoqCwWchSQCXaIqrTlLS5E/RLrvoHGDIglVj6VjQGeJw2FAurJvJeAxnaBA6R4HI0Uj28vBJ6oWomKFPlRoSeggonMJW1U9MVIuHcP/L9VXMxHfFGz5qgHYltt4jrDnXD1x1wYFOXh/nqtu8z9d7Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605491; c=relaxed/simple;
	bh=hXEhjoXTGKr3Vwtew8ygiSJVUL1IrUalP5AEHKMEToE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpt/kJ6hRxnyaW1IfAFalsj6N9MJtcc4eE3nlzdw3B5Mg0cALRwNQEiD59T0SXw/5lof66CWdnj78kLq+Eej6z7QkwnNXP3ZNlGi1U73e1TYNxMcVGvZHPNf7ddbi8+Hpbjyr+GIVlAAFPR95DlngPr8KtaAnLsyeXW1zMECrEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kZHq3SoQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kZHq3SoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2FC1F000E9;
	Tue, 16 Jun 2026 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781605490;
	bh=9ZWRzpBte72d+P+z1Hev6jmgZAd9SWMshTnM4EVHRLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kZHq3SoQ17hxAA1eigv1YSzaYGYo9NHgfhY+epSlzrVt9Nw/vNfHxP4M2vIOUuqCE
	 e5QRfxK0n6ANH6q8EeNrWhYw7vRqOv7pA9ZlYu2k+6Ifj5o3ZMzoQiaW3yETLLjkra
	 sLpRvrdG0pRnkv8Xo2gnpi+JnPhIFBLtCuAvcGss=
Date: Tue, 16 Jun 2026 15:53:00 +0530
From: Greg KH <gregkh@linuxfoundation.org>
To: yangsizhe <18392868223@163.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, yangsizhe@meigsmart.com
Subject: Re: [PATCH] usb: serial: option: add multiple VID/PID
Message-ID: <2026061638-skimming-composure-1b23@gregkh>
References: <20260616095631.7424-1-18392868223@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616095631.7424-1-18392868223@163.com>

On Tue, Jun 16, 2026 at 05:56:31PM +0800, yangsizhe wrote:
> Add the PID and VID to facilitate the binding of our company's module

What company is that?

> 
> Signed-off-by: yangsizhe <18392868223@163.com>

Real name please.

thanks,

greg k-h
