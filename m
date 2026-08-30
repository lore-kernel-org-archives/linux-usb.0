Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5575B275870
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788077778; cv=none; b=lU2KaBsmRlPP5DGMhycyOuOQ093K804cK5ShL/qx+zJRYfe9rkumoeGGBTh65PibDawgu6fCuzyQZoPf1tSB7Fg4LA+VX8iormwQEmM8Z3qsU84smuNUiFlSvcilhPUqhOf3FkExxgmbb2pEBwue/aICJIefyKqb8HVo3tHs1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788077778; c=relaxed/simple;
	bh=/Du0rQC7NJ2PmzZgnDhVRkUWBk4j1F0Wkbvh4+H3YWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcvyEO/sVGnd12rNBSB9t4W7xeZdAPjdWnddedCeOo8iPocss0ouNJr5ysWT6GH5szKq3GLjmFpQt67o9/0uN+FZ195lEnhQLpV4oDBqvG+mdVPkDSTp5o6rSThnapKz/7agohlXrANlS9YuL+PMrYgIAX8fKd11UwvQV5Ah0jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qqTVDiz5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qqTVDiz5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566E51F000E9;
	Sun, 30 Aug 2026 08:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788077776;
	bh=Lrdz7MRtRN7uPjkKgmjqS3ufL2cuHuqLQYewaJ2oFsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qqTVDiz5X9WE2D/jRdE52EKqZAe71NCORXelPtCyjoNlmFnA4oyuJ60+RUJUzAi1e
	 oCMKEf5kdN6WniPwjzThCduFDZQ1+0MWydG0AL7cHyhZ9xOCnRXaTaD4hcy6F4Ewvh
	 4X4/+lIKx/KWOGvkX+4Mvq2JCW0KgNyCp0bMnmmo=
Date: Sun, 30 Aug 2026 10:14:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Martin Rys <martin@archlinux.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: Improve "New device found" printout message
Message-ID: <2026083035-sadden-eastcoast-19c3@gregkh>
References: <6323ed34-7954-4f0b-b6c5-8e1b1ffc1648@archlinux.org>
 <2026083045-antitrust-sacrifice-ffa9@gregkh>
 <85d0669f-9e7b-4e53-a403-3b6021c837ed@archlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85d0669f-9e7b-4e53-a403-3b6021c837ed@archlinux.org>

On Sun, Aug 30, 2026 at 09:56:15AM +0200, Martin Rys wrote:
> > Nit, why is this in the body of the email?
> 
> It's the raw output from `git format-patch -1 HEAD -v2`.
> 
> Other than by implication in the "canonical patch format" section, 
> neither of these docs seem to have a mention to delete any of the 
> 4 lines that I could find:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> https://www.kernel.org/doc/html/latest/process/email-clients.html
> 
> I see that the first line is some compatibility start of message marker,
> so I am guessing that's not needed in any case when using Thunderbird.
> 
> Not that it's important, but is it possible to keep the Date: in, 
> to retain the commit message time?

Those headers are emulating a mail message, you don't have to include
them again in the body of the email.

The date will be when you send the email, not when the patch was made on
your local machine.  If you use something like git send-email or b4 to
send the patch, those headers are not included.  If you use thunderbird,
that's great, don't include them either, just like if you use a tool
like mutt (which I do for many patches), you don't include the headers.

thanks,

greg k-h
