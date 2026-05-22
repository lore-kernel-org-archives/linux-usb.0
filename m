Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE92E1A2545;
	Fri, 22 May 2026 04:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779425130; cv=none; b=BmC7kcNxq+zUGwUmVRSwJ0avpsX7o77qxIeAke1tEhnqOdUCoWJ9mJ7Zfkxc3fZLws0WHv/AU7kHbIN3JQ9Zb/Y5tFAwyNwY6kSJ+nn1cyODxaA3yVoY4KscmH65v8UCYza/9AuUF0V18SHdIU+WTwpBSJqnpGax7Fa5Frezh7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779425130; c=relaxed/simple;
	bh=8p6iBNtk8angBKBKqbsbPWFI+lK9qFn54AQTeK+Lc6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kstl50aqE1qFmrWaDkJpfwhYM6n8gZTqri0ZMVAHUJUuW5HgDtZmelKIYtMM6YXiU9AOW3ehNxfa9d5IT14YA2nGxbSbk5TqF5tZkUOjYPo0OLJuObPguRwg/SaQfwNY+42D5i0Ze3iVDgwptaUcBUaQvtQ2fM5RSYpsbqBmwZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ox9os61X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ox9os61X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3921F000E9;
	Fri, 22 May 2026 04:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779425128;
	bh=5zZBaruX0Piz4UoErSW+hQ/KWw5I5ffCqqnYncPENuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ox9os61XqtCkTk4YemKO2DIwEW63EngHLfgEgHj0U5fprQoD2jc4ckcC69y592/UU
	 1I/auMAVFfFrBbcxfsygQ2FFarFCS2z2SmE5KKBhhGpxUkle31j4TvoIu6CzSFQjbQ
	 H9dBxb8rR7RYbaLQI0LhAdMrgcWSWnXpKPQEVf4Y=
Date: Fri, 22 May 2026 06:45:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: oneukum <oneukum@suse.com>, carvsdriver <carvsdriver@gmail.com>,
	linux-usb <linux-usb@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	stable <stable@vger.kernel.org>
Subject: Re: [PATCH RFC] USB: cdc-acm: Fix bit overlap and move quirk
 definitions to header
Message-ID: <2026052217-willfully-snowplow-1f80@gregkh>
References: <20260506093213.1473262-1-guanwentao@uniontech.com>
 <2026052144-unwritten-washing-df27@gregkh>
 <tencent_59BCDC255EB2B97F0CAB385D@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_59BCDC255EB2B97F0CAB385D@qq.com>

On Thu, May 21, 2026 at 11:03:02PM +0800, Wentao Guan wrote:
> > On Wed, May 06, 2026 at 05:32:13PM +0800, Wentao Guan wrote:
> > > The VENDOR_CLASS_DATA_IFACE and ALWAYS_POLL_CTRL quirk flags added in
> > > commit f58752ebcb35 ("USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10
> > > INGENIC touchscreen") were placed inside the acm_ctrl_msg() function
> > > rather than in the header with the other quirk flags.  Then, their
> > > values (BIT(9) and BIT(10)) collided with NO_UNION_12 which is already
> > > BIT(9).
> > >
> > > Move the definitions to drivers/usb/class/cdc-acm.h where they belong
> > > and shift them to BIT(10) and BIT(11) to avoid the overlap.
> > >
> > > Fixes: f58752ebcb35 ("USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10 INGENIC touchscreen")
> > > Cc: stable@vger.kernel.org
> >
> > Why is this needed for stable?  What bug does this "fix"?
> I see that there is a bug that NO_UNION_12 and VENDOR_CLASS_DATA_IFACE use same bit.

Then send this as a non-RFC patch, as obviously we can not take RFC
patches :)
