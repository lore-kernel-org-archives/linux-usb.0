Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D74A2EA468;
	Wed, 18 Feb 2026 21:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771449590; cv=none; b=M8NSSGwbKsOgOrIPgihl05fJxU5XmgjV/bodOs9dGEHDmz+tld530BQpmHWkGX4nnwUShHNGNAIfoYvctIMbIp1qo9QZfQLfvItQjgdWEG8u0xnMF6T+RYK7NKfqwZChd04d7nj1TyaAAzUgLYrf4LIER3o3VRAyjW1dXggLs9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771449590; c=relaxed/simple;
	bh=u7rnsboERZUjmqmrF0Qqm/G3sCuNRHxiH4Pt20e6D20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jx/Blu5nloALFyHBtiwZM8CRb59WDDocpKKPvCOtPnYWu57u0fj/SZUi055mUjXOngLdhQh7zKLDA1vbIFunJ2wLYy3s8MTYj3hIJy+g3nGRR5TAh3AURUh8Eczw6xBIPGrCtP4+/+Ey2oIg2cuOAW9SBrOgq5HWPd8frKlfmR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fZX7p+vb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fZX7p+vb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF70C116D0;
	Wed, 18 Feb 2026 21:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771449590;
	bh=u7rnsboERZUjmqmrF0Qqm/G3sCuNRHxiH4Pt20e6D20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZX7p+vbiJtaCVT0ZLoNOj8VrAQgwSFXQiol+g72biF/LiruifYjP4TFDaWlJWWf7
	 RxhZIzUgeZjVT6Q5a6A6UsKVROjp1MnlSqoInUcR54qAkx+1IKIBePMJCjq0Me5erW
	 CI3CDJi+AQsHQ6TtFB1rk8KAfdYwjl2NA+9+6EWw=
Date: Wed, 18 Feb 2026 22:19:47 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: typec: tcpci: Make tcpci_pm_ops variable static
Message-ID: <2026021802-chemicals-reoccur-a35d@gregkh>
References: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAPTae5Kyaems-3HEGQ8hhgkiRVPJgjecGCHQ4iRF242k+L_d8A@mail.gmail.com>
 <2026021821-iodize-trolling-3bde@gregkh>
 <CAPTae5Log9f33u2gGtZSHZWZU0Q_cAgHJJaOD+M6dratsWFL8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTae5Log9f33u2gGtZSHZWZU0Q_cAgHJJaOD+M6dratsWFL8g@mail.gmail.com>

On Wed, Feb 18, 2026 at 01:02:50PM -0800, Badhri Jagan Sridharan wrote:
> On Wed, Feb 18, 2026 at 12:56 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Feb 18, 2026 at 12:35:04PM -0800, Badhri Jagan Sridharan wrote:
> > > On Mon, Feb 16, 2026 at 3:04 AM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> > > >
> > > > File-scope 'tcpci_pm_ops' is not used outside of this unit, so make it
> > > > static to silence sparse warning:
> > > >
> > > >   tcpm/tcpci.c:1002:1: warning: symbol 'tcpci_pm_ops' was not declared. Should it be static?
> > > >
> > >
> > > Thanks for sending the patch Krzysztof !
> > > Can you also please add "Fixes:" and "Cc: stable@vger.kernel.org" ?
> >
> > Why would a sparse warning fix need either of those?  Are you wanting to
> > just pre-load my "WTF" email bot to go off?  :)
> 
> I am still learning :) Wasn't aware that warning fixes are not
> supposed to have those.

This is a warning from sparse, not the build.  sparse is an add-on
thing, not a part of a normal kernel build.

thanks,

greg k-h
