Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEF8472F73
	for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2026 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932491; cv=none; b=Fn3cRmKWnockF0gtOGKn24r3cL3IPIx7w4uZWiem0S9MhSD6+Wtm1J6IiwjOmYkqfgqSKO5EVCgUXwoqH5SrAiX2Om+27iIH4lFhngsZhP92SUz5QDWLodfH3cikgYm6YkCGyM83xE4CWZcQcjdfQuM+mAN13PMzw2NpDtdeABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932491; c=relaxed/simple;
	bh=HcW33jkZUcdY9LRvAujGSedfeC6LfXiwho99A2N22U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5cHgqDM6OCqZUlvXvRPAFEEf7UWn9NEFiW7eOIqtH/OeMyg6NGecylTbzTdm0iNW+Sc3imU1BIizyZsE4HLUupLqOIoHNHLOUrIXsTMNy2B5VKlRwYmz+DPyPiInsHZmg3NwlHi2Fw2cd6NUeDE8uh2nCRHAQ0tvmZ2nYo//7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5ndShQ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5ndShQ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BC21F0089A;
	Fri,  2 Oct 2026 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932489;
	bh=o6SSFaPy107rMtmTgpgekLEHJOfvs9NS9z3awxWryAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i5ndShQ2pQFwDu3QFiirqcNg0lrH7IlCWp1oFKEv3DP+tOHh+U91LdfmkXbvEaiuP
	 waVCWCPrfCCvhUBjW4mfIFfc7e5Jurjo4P6pAReum2ntMvIzehnN/s8eCvPNA0mXTm
	 gJGv1sZibYKXUqPpnw83DQK6T0qBVBhHNF7M9bzSlIKADwQAwFpYs2ixzsVC/YCXGk
	 a00Jz+IaLn0ynoBKfqJzyM/DwBBok3V1b2aPkHSWfkyWFgD1kBK+0qbLT8tzp5BiX1
	 luzidIEbfcAuXl0DRyrEiAw+Klo1lDnN9/WRTOWygunkdKeqvZ0yKgCACZBZJLkl9N
	 cEqXx69n4+MBg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xCZLr-00000008qGM-1n9W;
	Fri, 02 Oct 2026 11:14:47 +0200
Date: Fri, 2 Oct 2026 11:14:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Reinhard Speyerer <rspmn@arcor.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Rolling Wireless RN947R
Message-ID: <ar92B_dWPdv_wJBY@hovoldconsulting.com>
References: <arZvlM3mT-pQPHaJ@arcor.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arZvlM3mT-pQPHaJ@arcor.de>

On Fri, Sep 25, 2026 at 02:56:52PM +0200, Reinhard Speyerer wrote:
> Add Rolling Wireless RN947R 0x9300 compositions:
> 
> Standard mode: DIAG + ADB + NMEA + MODEM + RMNET + QDSS + ADPL

> QDL mode:

> Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>

Applied, thanks.

Johan
