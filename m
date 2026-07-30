Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8533390C8E;
	Thu, 30 Jul 2026 06:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785392204; cv=none; b=jtztmZP6wPyoWiqmVkTNdHm7bvQVzbpdkzPA+lIWf2GIT2cdmPcNZC0a7IAf903/EN449rjp+POl/FGOZcT3kj/oc7WURbahYIBmABqgo8UrHxT4Af4W34pLw/f0a9k2AtioVYq5r0lyGYu8LnnGLrCBTqCSc7q1kRqEn1yOYoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785392204; c=relaxed/simple;
	bh=tWZ4wNXLnudDV5PJ1Fpd4DbGLhK3Enh+E1YOI8PH6L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BY7dmiuBMQ13OHgc6FJF8NJZLT/22yEJXsKZNRivsshdtUY79pDTnAWRlLoJOOQweeMOv5AUCyD1u/WbnJeEKbK8RdjCWL1sXOj7lsw/hZrYVXC0JfqXMqMr5pevL7p+0/pEKrNWIAG+BF6U768nNSp6Zn2bqPGZQUZxJY3iQVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0wcYAep0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0wcYAep0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E6F1F000E9;
	Thu, 30 Jul 2026 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785392191;
	bh=tWZ4wNXLnudDV5PJ1Fpd4DbGLhK3Enh+E1YOI8PH6L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0wcYAep0FtT+nhkLOH8J6T1Ewu2RCXEw6G0kIhwdlZ44pKDN+nSRNhx9xypbrHnK8
	 qOkr6WrZqCNIJ5yGj6T+6tod4NY7prWk2/JsCUtFzzzX7s1Z0BdzPcsgSWmQWiAUdB
	 m3PFB+aMty7aU0hxQ71qF/XYuWVAclDlPWlx13Iw=
Date: Thu, 30 Jul 2026 08:16:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: xu.yang_2@nxp.com, Frank.Li@nxp.com, panjunzhong@linux.spacemit.com,
	kees@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com
Subject: Re: [PATCH] Fix Null Pointer Dereference in uvcg_video_init()
Message-ID: <2026073040-popular-provoke-8d7e@gregkh>
References: <20260730055705.13784-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730055705.13784-1-jeffinphilip14@gmail.com>

On Thu, Jul 30, 2026 at 11:27:05AM +0530, Jeffin Philip wrote:
> uvcg_video_init references video->uvc before assigning it
> leading to a null pointer dereference. Fix this by assigning
> video->uvc first and then dereferencing it later.

Please say _when_ this dereference happens (i.e. in an error path only,
right?)

> Reported-by: syzbot+8dcac923582c28505fd7@syzkaller.appspotmail.com
> Fixes: https://syzkaller.appspot.com/bug?extid=8dcac923582c28505fd7
> Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>

No cc: stable or Fixes: tag?

thanks,

greg k-h
