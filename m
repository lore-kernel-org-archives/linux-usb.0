Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E599138B142
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076586; cv=none; b=ZNcGBzSJkynA10rd1nMS734DXw4EFpxE6q/uzIgtkJclNyD4x7B5AAAPfHI3h1YY1YvwjOY2x5SRculzsKFOtkkz+ULWt5JeXlMMOPFSTGStSTpHEuEpc1gn3qDIBwK5OnnrOg/gupFKDS/ah2o47BmhbyZevgxeLcV7ouY/VHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076586; c=relaxed/simple;
	bh=GNk83XD89rgVkp3PZ/KCyKHjLHTjzWpDI2Y3kZ/bQRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1k/Wv2q698pWFDKQhNOiXqrwIROa8RRPC7BmS6UPlNOuXY6k/JAizfxuJ75Cfh7E1N1AZXn2RtJcxEhzQ1/PFpUeGU28YQB3QaWLB/dPNdezDir+fi/ixpkzwbPRmxDiYqWdPRYemwIZjwT6p8dXDHM0AL2T9RuAYySyafQ3N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=DVXAf/Am; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=evMWj8y7; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="DVXAf/Am";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="evMWj8y7"
Message-ID: <85d0669f-9e7b-4e53-a403-3b6021c837ed@archlinux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1788076577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQEgixGQ2AenYO5RWnth4Ex7GNWXe9h/fv8CfOLHbb0=;
	b=DVXAf/AmTYvZmHnKHAoqW+UQ4t115B12b2DZUsAXpHQ5T6HT8eS+6ybVTjwHGH1NJInKLk
	LzeM31UWcs8eQjq/UL1SPIpcBwxztCnfk1XTgm5pWqJ/JDBS61EWaxXSP5J441K2Nr1SMK
	5IfUDVY7GUQu8IXfFg42xolzqEjm3k0/2lSTAlP5V6/Fum4hLpS/Qf4IV8kCgX//6qjsm8
	o6RgjzIOa9hKe1jRhUFKxGdbBtOSqAjq31AOPGLTw4lT45uyPHweMY8bTCDYJ1bmStnmai
	ACLVN+mn96zPhxRTbTdg2zPtxtcNUb0zoALJc0lL7PElV93NuItZ8iAVStLahpzNshR9Bb
	1abYrRUbiqNaql81VrhPHXtZM6Or8PdRqAfYwvGtoavWIZ5qvso8fVCUqFObB1fHCOj3dX
	lmc6YNxBpj8yxoKWjq18ZPry9v0Za2AST35afeLKEE6WgYsMlBpHIgtz9C8VaUq04w73YL
	CvMCHhn6wvn3FraAek5r87W2Ks/CGFqVGTj+9gzB0FNHciK3uOwQIl3nN8SldX7erAz79N
	6nsdTSBk2v5VNWGUloPvmYhycjXiAApQsFn/robxzpLEWJixQ7AMuankBA8uec2dluttrl
	Zv/U7qqc2EfLWGbKp/2YT11mVBfqafriXzZTMMcFHjm4Ry3Jp3rz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1788076577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gQEgixGQ2AenYO5RWnth4Ex7GNWXe9h/fv8CfOLHbb0=;
	b=evMWj8y72Lv20P/3kXwxkm2IKCiASY6o/JaVUelUztDazLlQ4pPTTk/uTiqoQ7TvzJ1sxc
	hiGdhK3iQB1hXuBw==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@archlinux.org
Date: Sun, 30 Aug 2026 09:56:15 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] USB: Improve "New device found" printout message
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <6323ed34-7954-4f0b-b6c5-8e1b1ffc1648@archlinux.org>
 <2026083045-antitrust-sacrifice-ffa9@gregkh>
Content-Language: en-US
From: Martin Rys <martin@archlinux.org>
In-Reply-To: <2026083045-antitrust-sacrifice-ffa9@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Nit, why is this in the body of the email?

It's the raw output from `git format-patch -1 HEAD -v2`.

Other than by implication in the "canonical patch format" section, 
neither of these docs seem to have a mention to delete any of the 
4 lines that I could find:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html
https://www.kernel.org/doc/html/latest/process/email-clients.html

I see that the first line is some compatibility start of message marker,
so I am guessing that's not needed in any case when using Thunderbird.

Not that it's important, but is it possible to keep the Date: in, 
to retain the commit message time?

> Please wrap your changelog text at 72 columns.  I thought checkpatch.pl
> would warn about this, did it not?
It indeed does - I wrongly assumed it only covers the actual code changes,
so I didn't think to run it after adding the commit message.

Will run it on any change from now on, and I'll resend the patch wrapped shortly.

Thank you,
Martin
