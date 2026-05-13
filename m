Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37A3A7837;
	Wed, 13 May 2026 07:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658131; cv=none; b=B36qGz44RINQbZbhV28868JUCing60CFf9VJSKMtcqtAjyFfw4gYq4RRvjsIA42uSTh6f9Z1IbCvoiA4dtlbIO7cp25NBQoQjSZZesEQ7o4HA9R3noDAFpnhR46HIzV28953Qw8YNBW9keDhZB2py7N44M52GH8emLSO3gEFtRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658131; c=relaxed/simple;
	bh=55aso7+J5D8BY5MIQPBCI+TUWna0f9NjMVbKAu7dmUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxTBVvFiAgxzIZuxgJzn3NHzeCYrCsAfG7dByQAyMeu0jHHDg6OjmU9TE7SgcSaUCy4MqA/7Lo8rjYyxPEQmdDZOFfaddpB6pr64piTk2UYDtkN0KHcVHQB81HPGaCBUkcaBDIVhsFyuT/yBy9g/reCnJkGGdMdTx2v8GOqRt88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vGtWWBY6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vGtWWBY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBA8C2BCB7;
	Wed, 13 May 2026 07:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778658130;
	bh=55aso7+J5D8BY5MIQPBCI+TUWna0f9NjMVbKAu7dmUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vGtWWBY6foI3pT48igcARBWPzMx/HmnhT6NRxm+e1sCsTTVh/VF/xUevRLH/Zo80E
	 H4SdNTRy726ubeII0+Dvcy6BHU4/wLofKKhvW1K/VlF4zQYBjaCJrwSYTEcgPwBQKn
	 oq0qx3snbkP/dEUejDicA4P6vq9jFRx+zNNqe3T8=
Date: Wed, 13 May 2026 09:41:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zwq2226404116@163.com
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH] [PATCH v3] USB: serial: option: add missing RSVD(5) flag
 for Rolling RW135R-GL
Message-ID: <2026051308-that-marathon-c864@gregkh>
References: <20260513072035.433068-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513072035.433068-1-zwq2226404116@163.com>

On Wed, May 13, 2026 at 03:20:34PM +0800, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>

Your subject line is odd, with two [PATCH] portions :(

