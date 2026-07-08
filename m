Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC336C59E;
	Wed,  8 Jul 2026 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511541; cv=none; b=BZr9X1KrZoxuhhJ1uqw2WmqG9Zor9o822FH46rZvxYfkjF12xsJPtepipNaYBumcZx0epRnS/MMVZWLoF6/OLkYYsbrB4eUjdI6qVTsybAhtz0qqxNsRuLd1jVxtDkdiKXjAQ1lf5tR5ui3IGA3vGpQNkQkRNBeEJUykp3pPlMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511541; c=relaxed/simple;
	bh=pc0965TKJvsgKBp/VxvpHZGZqroGkTQJ/o6QBWS/FE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRjNOKmIZ7oIDmUO1Ik7zDCcE17M5T93yQ+KDLxrYdwV4utqBqAySaflVudsDQJken3O3esEnXptcej1UzILuAK02zLNgBUkdZDQGzn2Gbeo+4WnldtQrrqt8si8FbzXbldpPw520o1d+GGj1VsxwjJsOD8iKsaJ7VjCBKbL8ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JrPUsNeR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JrPUsNeR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C830D1F000E9;
	Wed,  8 Jul 2026 11:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783511539;
	bh=HfNqFu0fQQadXLvYJdHO4LnO2Hj2tcf3Lq66N8GzzYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JrPUsNeR8LARQ2duHsMztM3SE6upwYXEl9QQZ0KdDrmn2+jCzbYEjTxR+ZqPNmb4h
	 FSiVpe9CuKEvh/oD3Vea5pbezxBI/pSljpsMZ80+KySbJRy+UZVFsuEwX7Vfh3vMgm
	 CKMZKbSd0s87BZj7PYeBDtSF6jPwGoXQfRrlflis=
Date: Wed, 8 Jul 2026 13:51:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Julian Braha <julianbraha@gmail.com>,
	Xu Yang <xu.yang_2@oss.nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v2] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
Message-ID: <2026070830-tattle-corporal-6fcc@gregkh>
References: <20260705065832.184-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705065832.184-1-kernel@airkyi.com>

On Sun, Jul 05, 2026 at 02:58:32PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
> also needed for embedded platforms. Select it when available.
> 
> Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/usb/typec/altmodes/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> index 7867fa7c405d..1f35b253d6b8 100644
> --- a/drivers/usb/typec/altmodes/Kconfig
> +++ b/drivers/usb/typec/altmodes/Kconfig
> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
>  config TYPEC_DP_ALTMODE
>  	tristate "DisplayPort Alternate Mode driver"
>  	depends on DRM
> +	imply DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF

I hate "imply", as this just makes things more complex.  Either this is
a dependency or not, right?  Why not fix that?

thanks,

greg k-h
