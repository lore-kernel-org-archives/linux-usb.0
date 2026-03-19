Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06540DFC3;
	Thu, 19 Mar 2026 00:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773880581; cv=none; b=NaDMAYf68lsxX7WJuBtMvC83xrCO+OcExbUzPN4UVdgD7BhRkQ2b7FLTakqA+qwSudxuuoBpLnsQR9HKa4eKBjzgd1Byfm5/iQjNhZgHxcvft44DiZg9nobWsEI+XRgDKE2qTKpfEIO6guSPDrKrn1iSNBxZP8QqCyWLD3bFE9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773880581; c=relaxed/simple;
	bh=sg15wkzdDU/+fgt4D8W0wwPLm9Uid0O+IZLqWN1Ra4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2kar5tCWQXUAmrmUiG/bQv1DE6ejghzSmx0c2EvdgqZY5J8fJRV9CDVKm4wc8pC/STEjmoyq3Zz4WUjOKFMFpNdE94ugpwIiR0LmQnJXXMg2eK1hrfp+tItvnXTdKlbifaDAH8Bsg5ptPNvMsUJj8e04rg2PWPJZRsMeI07ZXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org; spf=pass smtp.mailfrom=codewreck.org; dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b=htrSSy2e; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="htrSSy2e"
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id 512C114C2D6;
	Thu, 19 Mar 2026 01:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1773880256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wo80qY18WD/OuEcgD4zdP4oDkTaCc3WGmeSvHBenTag=;
	b=htrSSy2eR/qEI91rUiPkCmsZHoM7GmnoZcssHmMYCymPhg7L6QWCvdncUJFRlHLKFOPTg5
	Axl1gwbtb9FrVKmiDhA7hyB54bDk0Lh6CbbEX00QAOtxpqt4DdhhxfZEqqqwZqTfmyn3z/
	srvVlM+aI6cc+VZ4ihrqm9dVuZLK5ZdJuWZJbMap0o2KXHRwSfn8LqY2X5DYS1KkwdLCiD
	S/2TIdbdhm9I6MwSEmDV3cCk8o4dz24daHTGYuQQfuMuUpRvJ/+yyA7o1qLHpZJy1kyZBM
	QJUKrmwU/OsyrL9l0uxwLmoCFXXxmjnGRztVXJRIraNAX6+ADI8XwMK2ZO126Q==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id ee392a85;
	Thu, 19 Mar 2026 00:30:51 +0000 (UTC)
Date: Thu, 19 Mar 2026 09:30:36 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Hyungjung Joo <jhj140711@gmail.com>, ericvh@kernel.org,
	lucho@ionkov.net, linux_oss@crudebyte.com,
	gregkh@linuxfoundation.org, v9fs@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: 9p: usbg: clear stale client pointer on close
Message-ID: <abtDrEQ4ySmhujwG@codewreck.org>
References: <20260313171659.1225180-1-jhj140711@gmail.com>
 <abs0Q2Sw3WvLYFbe@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <abs0Q2Sw3WvLYFbe@pengutronix.de>

Michael Grzeschik wrote on Thu, Mar 19, 2026 at 12:24:51AM +0100:
> On Sat, Mar 14, 2026 at 02:16:59AM +0900, Hyungjung Joo wrote:
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> I wonder where greg did this review? Was this in another thread?

Yes, it was when Hyungjung Joo sent this to security@, so the review was
not public

-- 
Dominique Martinet | Asmadeus
