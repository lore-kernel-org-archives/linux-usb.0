Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31A25B0BF;
	Thu, 21 May 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375298; cv=none; b=cmGZt50ITYoxPYpxQzolOk+m044nyt3F61tQLyEvA60X4YazD4bO5jfm+xKmta0MJ75ZVEigyK9DcayfshxGIIiVmozv6kWqvh1QNAZUhH63BeQFpXp0nhaDG6lYN/fXeUzlrrA1Lqkx9yR+LF9272fAl0C6x50/Xd2a7iPLEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375298; c=relaxed/simple;
	bh=QlWgbW3pFkcQOj/PL0k5HaPpVqTox669Nkqx9Y+XxFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpaZxLEOf6Npz/87aeFf4/MlmCSOdkuk0heKtG/sihMmuWjl5fx/I1GQw6hdzXrRbnL4cPo5WJPnRjliH1OWsJVk34KKG3nDp8rxcRgPbtR1FOMQcLiBQbcj0z/1KrohA2s54WD120mVeFB4JnEKEJR7Yj7QAs2eqhfQ/jNtzl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0A0wY6vU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0A0wY6vU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90ECB1F00A3B;
	Thu, 21 May 2026 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779375297;
	bh=HEx9DxUrs/iGvi6fLWKnJs3KTeqse2/9ksgs21gAPiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0A0wY6vUoCQBaK1MBaj4vfBaRpn7/1jH98WpdoDu+KleussBcYjxP/hUH6RwRQQDb
	 HR/EVzLAqbsBMYmPQ20WGlxwg1H6iFJU8dbJqn2gpoRQguLqMIQgQ6f9uZISNPBsBi
	 Nhq2+aTVgtFzp/LOr+pbfnexZk4YVhK6juPgbtwg=
Date: Thu, 21 May 2026 16:55:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: oneukum@suse.com, carvsdriver@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RFC] USB: cdc-acm: Fix bit overlap and move quirk
 definitions to header
Message-ID: <2026052144-unwritten-washing-df27@gregkh>
References: <20260506093213.1473262-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506093213.1473262-1-guanwentao@uniontech.com>

On Wed, May 06, 2026 at 05:32:13PM +0800, Wentao Guan wrote:
> The VENDOR_CLASS_DATA_IFACE and ALWAYS_POLL_CTRL quirk flags added in
> commit f58752ebcb35 ("USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10
> INGENIC touchscreen") were placed inside the acm_ctrl_msg() function
> rather than in the header with the other quirk flags.  Then, their
> values (BIT(9) and BIT(10)) collided with NO_UNION_12 which is already
> BIT(9).
> 
> Move the definitions to drivers/usb/class/cdc-acm.h where they belong
> and shift them to BIT(10) and BIT(11) to avoid the overlap.
> 
> Fixes: f58752ebcb35 ("USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10 INGENIC touchscreen")
> Cc: stable@vger.kernel.org

Why is this needed for stable?  What bug does this "fix"?

thanks,

greg k-h
