Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169807;
	b=cwCeH0Q2M0zqYrJqlhgCecGARtNNJ5IOI6nBHTctOqhdypJ+t+Z091+sOH5PGGOTY7oH
	 BLxzRmt2ttiaAd7FwkstmDt8iSNNvdACbHtvZ/GHbUW2HC+uT/QgH6OPROvzwpvEqglEe
	 PLPGzHVYcQff19p0ZZkqHFvgUUb7PzWeYLl/y+zn6dZHctVGfT6WKF90qfZb41L8PeiAN
	 86r4+u+63pAKQ55vu2c7m4BN82sgvF3U8HzBVH4o3O/i724MSx4iETCGpNhE/7IGWSJG/
	 JAR+3zORB+TYH2elK23r0sU6KktczSeh2IBNI3BFyuAijHag8itSeoOEumVWue8557w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169807;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=i5J2QnRYCSD3w6uxaIZe9M/n6HBYQxWD9PQ4XfOOqNw=;
	b=thsqWBJNoPG0ANCuseg6fYFo1zrits2wsK8Gdo/Cetlgh13YuU6W8YjeVUw3qPKi+ppe
	 ly/Bo53t+HMYFYLPTruVCVldIL0d8zrJaDteFUjDOw7C825MZkoo5UTILwxHzfkjHXG5q
	 p6XV2BplEnIzKQeLS8Z89uMKnoaNVUG6Jrjd9cE2zIvmQ6fnfV0KWTQ1KVGkbg2aAPgh9
	 lCtD9kuqJKrb0Ogyy1Zj1qOdZRtFbZg6aFJLbWxUOor/MebSBkWV4Qy81+HjfNp/RJ2lM
	 VxUIXgn7B+S3rS8pAJon0xNhnCbY5HuJOQLmi9wtSTDUxyOLkYHiB3jV1I2if1/Zpcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rDp3sks0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8767C606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rDp3sks0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0B71F000CA;
	Fri, 20 Nov 2026 10:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795169807;
	bh=i5J2QnRYCSD3w6uxaIZe9M/n6HBYQxWD9PQ4XfOOqNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rDp3sks065KjS1TQiiRGpeH5lz6H49+xo0K/ECN91l9SA8CRBrgObALGqTt+DTq75
	 DnAVhrBzRX2rfzSuBRNogGM+tpL19rwUxwvtPicW4YtITWaVmlM+kfceAVFwDx7BQH
	 oBSSFjKvbaz1uzSWtdbltR+ydRebB/w9Qteuvkx4=
Date: Fri, 20 Nov 2026 11:16:44 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: viro@zeniv.linux.org.uk, nkapron@google.com, me@samcday.com,
	michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 0/2] usb: gadget: f_fs: cancellation fix
Message-ID: <2026112027-purveyor-chastise-5026@gregkh>
References: <20261119151942.44304-1-ingo.rohloff@lauterbach.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119151942.44304-1-ingo.rohloff@lauterbach.com>

On Thu, Nov 19, 2026 at 04:19:40PM +0100, Ingo Rohloff wrote:
> This 2 part patch series fixes a previous commit and does
> some refactoring.
> 
> Note: The first patch in this series only applies cleanly, if
> "[PATCH] usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance."
> is applied first.

I don't see that in my queue, pleasae submit all of these as a single
series.

thanks,

greg k-h
