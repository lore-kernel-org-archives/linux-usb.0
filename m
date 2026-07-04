Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7F20DD51;
	Sat,  4 Jul 2026 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783163334; cv=none; b=ty/Ly2pbBf86dQ9g7dweKJt6eLWv4jlZbUg8noUSHXJpVZJi7zbb+ftBdW1n640LtNckp53tqJ/4A/HPHaS1rTbLq9cyOV15Gbb5l/8UMuZVS0i/7YV1XgbgNIfx7S80L8wTSMoWiFiOOxxCvDhF43gStGksu4Lo3sMfDmPfF/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783163334; c=relaxed/simple;
	bh=VU6VA02RS3vKXI4o5byLiWhcrDoIq0/oZH4Dz7QM+fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnD/1WPGuv3cM5Jwp9nRL3LcbjQKYnjsng4yACBkvUo3haScQE/oI3OEupr/Mz3JlsEOcYnf/ac9Bzp1Lo9UvG8PXp7Pvsx6lrsRp/Ir/BoiEMYpFTt4LWFfteSi4k3MSAKJ8eW/4Pd+BRXSTBqBurTZAEz6dox2dKMV+Zcr86I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rx2S0Yl6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rx2S0Yl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE91A1F000E9;
	Sat,  4 Jul 2026 11:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783163333;
	bh=Bcb7aBNE2M/04KEIu+7Ft1wTVtvmBSyY4Pb5rAj2zvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rx2S0Yl6orsVSZkZuOx9by0EfIWc3+OtC14YhconSjHOGtqaTHI4r+amocF1TlqBA
	 P63VE9Ntky7zDU/gzO5/T7d2onxd71antU1O3ij6TkEbnG5o9Utwb6czYJnlLxlxF6
	 hgykVR6NYcDZK0XTVDWaqU5V03lJXSfXqKTvcD4Y=
Date: Sat, 4 Jul 2026 13:09:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andy Yan <andyshrk@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andy Yan <andyshrk@163.com>, badhri@google.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Fix VDM type for Enter Mode commands
Message-ID: <2026070408-elude-patronage-9295@gregkh>
References: <20260604105059.18750-1-andyshrk@163.com>
 <aiLHBIYmexWvmlha@kuha>
 <CANbgqAT+B34JNMCnVBg4kk1X_0PX+nFmSgLY6qytRfJ7jnfsaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANbgqAT+B34JNMCnVBg4kk1X_0PX+nFmSgLY6qytRfJ7jnfsaQ@mail.gmail.com>

On Sat, Jul 04, 2026 at 05:41:53PM +0800, Andy Yan wrote:
> Hello，
> 
> Heikki Krogerus <heikki.krogerus@linux.intel.com> 于2026年6月5日周五 20:58写道：
> >
> > On Thu, Jun 04, 2026 at 06:50:24PM +0800, Andy Yan wrote:
> > > VDO() second parameter is VDM type (bit 15): 1 for SVDM, 0 for UVDM.
> > > Using 'vdo ? 2 : 1' corrupts SVID low bit when vdo is non-NULL
> > > (2 << 15 = BIT(16)). Enter Mode is always SVDM, hardcode to 1.
> > >
> > > Fixes: 8face9aa57c8 ("usb: typec: Add parameter for the VDO to typec_altmode_enter()")
> > > Signed-off-by: Andy Yan <andyshrk@163.com>
> >
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> 
>   Gentle ping....
>   Which maintainer can take this patch ?

Please relax, it was just reviewed yesterday.  There is obviously no
rush here as it wasn't tagged for stable backports, so it will show up
in the 7.3 kernel release, right?

And as always, if you want patches to get accepted sooner, help out in
reviews to reduce our load.

thanks,

greg k-h
