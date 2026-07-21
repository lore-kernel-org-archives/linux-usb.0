Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCE82DF3D1;
	Tue, 21 Jul 2026 05:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784612212; cv=none; b=DjjSL8O3UVi6DnKp2/viMnCApF8Fp7SdLh05xeIZMi3KGNv82v4PBoHXYo0Xws1CSU0MLURHHoYBeSm5VA0afY4LfBJCmCwKDfYVx1pxqTN0X8py0ihO6tPXjguVWBKn0YXIWXyOw6XXXKx1RN8nrcMMaLMJeRkhRlyne11vJM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784612212; c=relaxed/simple;
	bh=ZKyIKZNU+GAQ8BkVwcgz5FrjKZc5uL8AOr4Znf+/R/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5rS9eciUmV9f9hOLwFmDpEYJ7maiGfssbKd5p49lVLoqLiMH6/QKHITNz9tQYrLDu5J860uP0z/dzB7prsSya+B2fGwhj9fo3uM8IBCek+GbdRTI005kRtL3Ni3HhQJgJeBns1A/FvLyTEjw6TmPzDNUSv0CD1C7jLLgFkV2OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ypeTCKIk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ypeTCKIk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E9E1F000E9;
	Tue, 21 Jul 2026 05:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784612210;
	bh=meZUKh9xJZBtVy8bkPyx7TyFPcVJFYiEAz7cU/2rGz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ypeTCKIk/Oy2Xhm+zOgqPgbBkWD00KQiF4q+4BmSZw9Q5+wk9hsLsEpWhdXSc+AJY
	 CWUVjXiHuzpgBJ4s769tkjkNrNhpFlrFwNTjajU0Lg46hG1gPfa7QqThaqQX008XLt
	 Vs9WmY/+3jCDSNCraK5wkOQQqpj48SkqSWMSvKKc=
Date: Tue, 21 Jul 2026 07:35:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daehwan Jung <dh10.jung@samsung.com>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: usb: gadget: u_serial: fix stale req->dep panic on
 disconnect/reconnect
Message-ID: <2026072102-acetone-revenue-f4b2@gregkh>
References: <CGME20260721013831epcas2p18cc80c836585f3b38f718881de13cf92@epcas2p1.samsung.com>
 <20260721013509.2327242-1-dh10.jung@samsung.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721013509.2327242-1-dh10.jung@samsung.com>

On Tue, Jul 21, 2026 at 10:35:09AM +0900, Daehwan Jung wrote:
> From: "dh10.jung" <dh10.jung@samsung.com>

We need a name, not an email alias.  Same for the changelog, your
internal samsung review should have caught this?

thanks,

greg k-h
