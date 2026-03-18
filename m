Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1953DA5D3;
	Wed, 18 Mar 2026 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843064; cv=none; b=CgLDzqLevI/5qpzu+Y5+Oic+zJAGiWQTtV8pzFVHly/+XZHCMYFL7qGpQLSkf0O7dn5uMHxZ3iiuYt4iv/pyrhnOwW9gOA3gXWF//gXcPukhaz1PQHBgk+n923jMKwpCjgBFp2f2+POOe2022E990uWRDGSQPc+yrJObvqbw9Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843064; c=relaxed/simple;
	bh=vAtr78oJYr5MldzDgKeEeuiZPlRQiX14HXxdltXPPoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cll3Cd2FMV8kndNYapduZjRMw93SC5s8A6lbLIeadc+K3ul1DwpI6lHBkd+enruusP1vH4/buOKSkvCHWOGNLpYl5TI5OQRz3KzHbypHLavEEF1NIo2UaCG5YUNV9FvT7OT+Y5RkvND/fvPMQz614uZFrndLPwQysr9EQfkZNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TUihieB4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TUihieB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F96C19421;
	Wed, 18 Mar 2026 14:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773843063;
	bh=vAtr78oJYr5MldzDgKeEeuiZPlRQiX14HXxdltXPPoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUihieB4pe/3REli7xpBXL08UlYR9OF8PDwgmghzFTrwlcYvgIIAN3EmiEn6Onhx6
	 ItY16qcXPxV0GzzVV9DpI51sErebJqa4+wD1dsXQgk6dc65fu/uzloBe5A4Y+v0rQy
	 GpT+kaUWmH/m35Tgay8tncfJmB6jQcNDn7p7tZk4=
Date: Wed, 18 Mar 2026 15:10:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Loke Forsberg <loke.forsberg@gmail.com>
Cc: linux-usb@vger.kernel.org, khtsai@google.com, raubcameo@gmail.com,
	kees@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
Message-ID: <2026031829-tinkling-replay-a53f@gregkh>
References: <20260316092505.8841-1-Loke.Forsberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316092505.8841-1-Loke.Forsberg@gmail.com>

On Mon, Mar 16, 2026 at 10:25:05AM +0100, Loke Forsberg wrote:
> Replace kzalloc(sizeof(*ptr)) with kzalloc_obj(), to improve type safety.
> 
> Signed-off-by: Loke Forsberg <Loke.Forsberg@gmail.com>
> ---
> Changes in v2:
>   - Remove GFP_KERNEL flag as kzalloc_obj() defaults to it

Any reason you did not even test build this?

Please be more careful in the future.

greg k-h
