Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30BC388E65;
	Sat, 23 May 2026 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779535338; cv=none; b=EoZH6gsqLZuV+DuVoL6FDPkgUwvqxBJUNRoPZnXG30fame0dVhFj4H6eWkzDO/bCQV1oZvSsLwYDng/naVLqfZ19HOOTsUsGEahoLMiV40PT8Xrk+w6nrjjMXw69zONJ/MW0EDcYwnxLrt7GwrBVjnkRbNpGzYmWd/6LHZAYm4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779535338; c=relaxed/simple;
	bh=3z187oJdspEvfdjBQDnCoD0zYJjSgMVe8daGEQHiO0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeI1RNPB93oEfIzIamBwSQgNPwqQ0Xz7mMwCeI1dAYdPqZiTrHfzYxJpKzAyNLN2vOPQuRNWkVlOjEmeZqJ54OS8m2riPvWOWHhOki44hU+nrI2k18lMbjVGVMB9N5wvo2kOLKZjPD9ORK16H9GGVDVlv6rRI2QUFiBLPMMthkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fCurXfNj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fCurXfNj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D381F000E9;
	Sat, 23 May 2026 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779535336;
	bh=Fo4xH9DlFocBUzd0NxxvNQMTDYgzgVIXeU4G1m275jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fCurXfNjT5bPTrlbm+jzAji705gTGEDr/x0IqFm/Y6g8PUOPwx0Yg+RdaMJOqHR1P
	 lhS0dm7KjgX6jy1HRam0tMlQelNhm1eSva5nBDF16q2b+I3WleowEBjsE1S6NRD0+/
	 74rKlBjXl9I7NFW+U0FFjAcvRQtf0oaBmE05wu90=
Date: Sat, 23 May 2026 13:22:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.1-rc5
Message-ID: <2026052311-lavish-evergreen-61e8@gregkh>
References: <ahFmuYsT3E8GcG5h@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahFmuYsT3E8GcG5h@hovoldconsulting.com>

On Sat, May 23, 2026 at 10:35:05AM +0200, Johan Hovold wrote:
> The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:
> 
>   Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc5

Pulled and pushed out, thanks.

greg k-h
