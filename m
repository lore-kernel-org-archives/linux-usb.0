Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48582749DA
	for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788029223; cv=none; b=dq/YoKU0EKGzjILrxp60gc2tCdKGviO19F2dRtlf2Cun8VOL2J/hkKqE4sQDqMU398SjM9Gb85cJJeim+hEFPJNa/IRwDL14M9gR2DOssVlfmHGCwSX7H1ALifDLLAQiL1g5J1ZQXo0DQdDuvEI/R/4QD/W5PuRORmMCLd6KEhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788029223; c=relaxed/simple;
	bh=LzI9SmF8HYAv6jCAvykWh0daMwL4YdLHHgeK6i4A/Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ML7KRdU040jWpuImzXZ6ZAqHlMHo94ycQ0AdoqB4Ko7jC2FD1svbPMJNv/d5UJLCREdZa6c/5U4tl01tkpFRvMF2jilbsA0MszWrOK8Y0eVU+kl5DZIzBef2bOj+CGzdXATeZI8laeJ5UstYZWfTUffq3o7+6z8TEHmoGBMx1L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=zVRpmJC7; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=bKj+/1sB; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="zVRpmJC7";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="bKj+/1sB"
Message-ID: <ddc6c7fe-9bfd-466e-b1f0-8fadda8070d6@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1788029215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d19ZKfIMt+U6tFeohDaydnDrFf2gDOkZcLU58US3VSA=;
	b=zVRpmJC7CuIzcV7MjxOY/ZFZly5WH73rv/UQxmwixV1nb6GE2U0aBHFBRzTX/nSa5gqQ5i
	hk82StdtJfYTnp53KYTmmUTr2I7nQs2IGNYtFXkEvsLDXtd3VuEQXj/vjnCniLDXvP2bwT
	QegEWCOPdqs0i+2iAcqfEQl682aYlGtpjhQLPw4w0rn8DhHwF486yL7VtzqEs5gdDtcakK
	2Hp5+D9o4EYOGNYlWTi2qgXTh9I4tMbiyfjvw/x1XBCsqT6HQrO2xsMh6kicdHFdOWzHIL
	aZ4+1P9WE74RflZoQOu7lar+gxe9C3QHl2w95d/wH1ZmHGHN1ZY+mRZ+m7453wAN9Y0Gbk
	1Vw7eC3JKdmfNmPUESIYYC81Ddtu+b3cSwV7+DQDXIU5Nx5bed3gsnzglEOkXLuLIPgYxT
	8flW2Pdhg6ZH8Onb2AngeTStuJ2TaX3UobsKMAYPz0jskHBUUetj3f9gKHcGNcnWtyFWbl
	SNW0re1hivt0HzTxPvyzG1MYcUO9mgZHQolulThHCgcZYWuJNWet5tP6weCM8WjbtLeM/k
	Y+RDAOM1iTqU6WoizgnaYfn/++2whXPMsXYgpJxjlXGP/N3JOF0p+/qdIgsXBVpHhTOUhA
	nwuclB+CbzBUh2MX4IGJf0O8UGIdz4Nw8yMEd7d5Q1vPQCCD3FUMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1788029215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d19ZKfIMt+U6tFeohDaydnDrFf2gDOkZcLU58US3VSA=;
	b=bKj+/1sBOxEsoLrKkkvAC0Z8fh/mpYhelb8o0kTas1DliVyf9GqwVRcqHHmBHkNSk7Qlq5
	oyOsQRHSTFvqA3Cw==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@archlinux.org
Date: Sat, 29 Aug 2026 20:46:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] USB: Improve "New device found" printout message
To: Greg KH <greg@kroah.com>
Cc: linux-usb@vger.kernel.org
References: <c9fb1eaa-9c88-4942-b6c5-9f7efbe1a133@archlinux.org>
 <2026082855-repave-condition-9f2c@gregkh>
Content-Language: en-US
From: Martin Rys <martin@archlinux.org>
In-Reply-To: <2026082855-repave-condition-9f2c@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Cool, but this all doesn't belong here, the patch changelog should contain enough information for us to understand this.
> The patch shouldn't be part of the middle of the email, just send it on it's own.  
> See lots of examples on the mailing list for how that looks.

Got it, I've resent an amended version as a new v2 thread.

> The patch is line-wrapped and whitespace damaged and can't be applied.
> Perhaps use a tool like git send-email or b4 to send it?

I have attempted to prevent this, but since I have somehow glossed over the email client configuration page in the docs the first time, 
I've failed to apply *all* the needed Thunderbird changes.

I've actually tested it this time, which I should have done in the first place.

Martin
