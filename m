Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F7C31715B;
	Fri, 22 May 2026 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442277; cv=none; b=P+dSLqJEjzwyF905gEL0GvBzDFRo66XP1fXR26LxfaZTuNSMSatM8Z11ZizYAZQlUz9gig0ar7gm4Yc6LNgiPcrtWZsmp6nnHD4jQltqfR1LrCjdmA0NdkzpsML/SZPlPeKw4PssxSyFdJ28qyy73poikqfRmrIdsWtLXId7NSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442277; c=relaxed/simple;
	bh=WUNrpMlYxu2Qz3ZPkgconXyx6oNT6ipfDpyx8TRa9gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQ4cA7CMjlXtW6JREmU0bGMvrGxdpNVy78Sl+71qe9MmAePp2dYkHzEAottdUalRL3eLG42lEnObbIG2WRRWH+EQipyu6PpogpAm68v8JyEvcWErsZAGbmXq+tRIibNituPOTGo7MU67o66Dz33L6OeqyBLnVvZuXRLQvdPdBTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FXnQI19d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FXnQI19d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35281F000E9;
	Fri, 22 May 2026 09:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779442276;
	bh=XR1kqTbde+Rh9VvDuMVeTogE1PT6Tu8xW+85JQqG4ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FXnQI19dyIB/BJAHi0a3ERE98wVh5KfBoHn/JMaGdrJiXa8a0AAd6Aec4NMxCJtln
	 xytHGALlcrxgLjo+u77VCsD6Qi/AYxn0HnvHFjDGfAQRh99xRuwCdkqEEebfxP4Y30
	 iRI/aHo9uATEgFUW38QlRd528kh0BSKTWcKDEP24=
Date: Fri, 22 May 2026 11:31:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [RFC PATCH v2] usb: typec: ucsi: Move long delayed work on
 system_dfl_long_wq
Message-ID: <2026052209-distress-slackness-a7cf@gregkh>
References: <20260508143853.330151-1-marco.crivellari@suse.com>
 <2026052234-rejoicing-agreeably-0fc5@gregkh>
 <CAAofZF66esOcaaAM=vy5Pcko4-t+_pteFYa1om0vMyavKnNKkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF66esOcaaAM=vy5Pcko4-t+_pteFYa1om0vMyavKnNKkA@mail.gmail.com>

On Fri, May 22, 2026 at 11:27:22AM +0200, Marco Crivellari wrote:
> On Fri, May 22, 2026 at 10:37 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > [...]
> > What "comments" do you need resolved here before submitting this as a
> > real patch?
> >
> > thanks,
> 
> Ah, sorry, I forgot to remove the RFC. It is already fine like this.
> Should i send a news version removing the RFC prefix or it is not needed?

Please send a new version.
