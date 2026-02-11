Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C6220F47;
	Wed, 11 Feb 2026 05:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770788214; cv=none; b=ixc3CpxGq4AfW/QX6mSSwijA02fJamhwZK4CEoYv9HcOJOP00Vd/Qlpk08h6McUoSBP30fnE9IFXLJA+0R6E63yb7bluR/Zh7SQk7v+aV6UY/XDz8mnO+ktSFzp+DgeIn9spDrxn14SNxjWA/Ig3vC7LAnAFjeKv8hfekYBlKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770788214; c=relaxed/simple;
	bh=LZsgexDqs1qtJQHuzsAtTfs602h3Q8nrMh/AvxbfEzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iu+gL3tIrLxK1G07IJbweEgOYylZV3iyvrEmeNJ0gGPWERn8LT3uDUc9rJJkQCxVeNug9/sgn9J+V+0s0cP2vKRCqgQyZ2C797nTWK9Ws7dB++owDhpEba5v0OQJ+M+fUMLs9UDtR/mvitbEO3HEXcHNtWA/dyjYDkJDF5wB6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tg31xsiW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tg31xsiW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D80C4CEF7;
	Wed, 11 Feb 2026 05:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770788213;
	bh=LZsgexDqs1qtJQHuzsAtTfs602h3Q8nrMh/AvxbfEzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tg31xsiWC/HfGrYcvEsy1TD9N+olW/GNoAhqys+jOVPc4qFbzgA3m3eIB8cEGqcMf
	 YqTqM4NsuLeOO7MInVOyPxgGcJeLWJfqxkwjQeHYTKy4uMoFkIserJ3WV6pLoep31o
	 3USbbYxpwGB6cHql+sD9pag7VqSa2rJl8HFHuljY=
Date: Wed, 11 Feb 2026 06:36:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Pei Xiao <xiaopei01@kylinos.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <2026021133-mystify-division-2468@gregkh>
References: <20251224070022.4082182-1-acelan.kao@canonical.com>
 <CAMz9Wg_H0HrDHvnvKbPE7XMtBwCQ=2poeqseNW_RdoOC-DNrDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMz9Wg_H0HrDHvnvKbPE7XMtBwCQ=2poeqseNW_RdoOC-DNrDw@mail.gmail.com>

On Wed, Feb 11, 2026 at 11:32:37AM +0800, AceLan Kao wrote:
> A gentle ping.
> Please help to review these patches, thanks.

It is the middle of the merge window, nothing can happen until after
-rc1 is out, you know this :(
