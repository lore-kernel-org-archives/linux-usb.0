Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059A3425CF2;
	Thu,  4 Jun 2026 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573554; cv=none; b=HKbFwH8IAG4FRke47mpOkQoI3h6tpN5mFD2pDdmZsxoM1aeVh6pg7S9lk1Ci0bZXiOZfWRf4r3+fnrY4Vw3Tr1J+yLQV0GGTwnBy2IaOm8tYtaqXBFseOYejta1Jx7LAROBim1uLehDtJ2WMyIS3hBhSf2NHv0LlLtaK1nM2JZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573554; c=relaxed/simple;
	bh=tyG6fyCYzaoCL6Y4W48Ew7UmrX3fQav6liY9qXUAKVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BI6j/Um7qH6NgwEeSrgv49Own/rTna3j+qaYlbVwTXVwuTSknWOi3ly8LfxgsLCNGmcUT+yio7CGicuFW0zx+vgwP+go3aDFM21ubCc2+pS24KnhIKRMl1LXF9TwV0s2IrhkC/ON0xJtmcR5JF/XO/r/hP7nlXOKMxgwI/ETYhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNGs+s8x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNGs+s8x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB4A1F00893;
	Thu,  4 Jun 2026 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780573552;
	bh=tyG6fyCYzaoCL6Y4W48Ew7UmrX3fQav6liY9qXUAKVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GNGs+s8xm9G2K5CzDxHhkSyG4SCayKc2zFMIARNGr56kDsJfGYIRXNj/UsckDaQyI
	 HjRTP1PyKpwuMRXzwuu2TKPRF1yTCkrUzceReeQLleNZaOwqhsuWYpJw6KwUzqoQxf
	 +a1iMXM2bw+G3euHajI4A+e3YoFeDPjXOFykosT59o1MrLRzF3TWOKv+ZUBXRauVJX
	 3dsPWHFnvrt9KlAAfhtF7htmVTe1FZ+cRvCunQb6ohIPnPKbJtd3U1pqRaMJUMGbwC
	 xok1/IIYuBKmNNPKppKXYyHa25lE7/BDjcPTcqGQAya5aCZSortMaFeQZOznSZJVkQ
	 9EFdwwaXcslww==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wV6WE-0000000BKmK-2YBR;
	Thu, 04 Jun 2026 13:45:50 +0200
Date: Thu, 4 Jun 2026 13:45:50 +0200
From: Johan Hovold <johan@kernel.org>
To: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [External Mail] Re: [PATCH v2] USB: serial: option: add new
 usb-id for Dell Wireless DW5826e-m
Message-ID: <aiFlbttulehKSq5E@hovoldconsulting.com>
References: <20260604-dw5826e-option-driver-v2-1-00609f65f5ae@compal.com>
 <aiEklcHp5m6H70T2@hovoldconsulting.com>
 <18167573232343f9b75762813fff5c40@compal.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18167573232343f9b75762813fff5c40@compal.com>

On Thu, Jun 04, 2026 at 10:31:43AM +0000, Wu. JackBB (GSM) wrote:

> ================================================================================================================================================================
> This message may contain information which is private, privileged or confidential of Compal Electronics, Inc. If you are not the intended recipient of this message, please notify the sender and destroy/delete the message. Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon this information, by persons or entities other than the intended recipient is prohibited.
> ================================================================================================================================================================

Make sure not to include footers like this when replying.

Johan
