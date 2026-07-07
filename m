Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E1819E992;
	Tue,  7 Jul 2026 00:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783384003; cv=none; b=UVvLimi9EVxy64BaIoZBi6rA5hJGcCc+pRUHzKWYhG7FcoPRf9IfUAnWeUmmhTP1EEszyqOqrTgx4HjwPpJ+knnBevyQg5mPj/HEWdxpHTFn+F3/jWVfTW6oksIGWPNnRwoA95I2pTDlLjfMQ7JfXVYUwNwpEy7vQpqz7FAwyD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783384003; c=relaxed/simple;
	bh=ftEq1IkswfgRVoPgwjn8y6Tvd4IIbCvcPHvSBMadJi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4iq4OffZGM4rEDVUTLvJFW5diQX3MTify4VcMIxcWFloJtiPGRZj+yE1Jr/0PVbZ6YQaShMQwBiucVYPpKE2FcN6AkDO8snzNLBFIjh3yj0EWdL6aSwZ9eEpSvMDBajJak/hvSGaVWiu6S2ww+dpJSr98f373F1KdU6d7B3t0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OD4SmDd0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OD4SmDd0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vXYO2KC5/ZFSl5HJ8XTj82g+7gASN0b9omoW/J5XJS8=; b=OD4SmDd0cyjJCssJabjwuE+TKg
	Pn6AkghpkQm9HzaGwx7EtqyR6JqAuZNIRzInkzbGuEPjc/5PpR3e9uLT/pZv55g04k6KaOW4x7zwJ
	KM96ixZ/s1GOhiKEEYDneQWy40vwm6KM3fNUi2pnmHdBMVnUqZYJP11kzpTeWXQrtitC1h7Qgkso7
	W8yuG/uCEwUi5t4EO+5+vmiBy+XcalUqT6jXYsBSDOT5nhIWatMEzwn/PVrBB8cKv7m3k4fiIrkNS
	WwWwLxbfeBgDZPVWUTw7HDMC+4uRusV3WdUgKijZ13G6VMICDLlGj5oSESeXLaOi67iRXriJI+rsN
	oTvqv5Cw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgte2-0000000Dpmh-11fd;
	Tue, 07 Jul 2026 00:26:38 +0000
Message-ID: <049d2ca9-c1ca-4834-955f-5c2f014eca82@infradead.org>
Date: Mon, 6 Jul 2026 17:26:36 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: admin-guide: thunderbolt: fix sentence structure
To: Manuel Ebner <manuelebner@mailbox.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rajmohan Mani <rajmohan.mani@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260706181429.264791-3-manuelebner@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260706181429.264791-3-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/6/26 11:14 AM, Manuel Ebner wrote:
> Replace ')' with ',' and add 'is' to sentence.
> 
> Fixes: 3fb10ea4ce86 ("thunderbolt: Add support for retimer NVM upgrade when there is no link")
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/thunderbolt.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
> index 91a6cb109988..ff25fe853706 100644
> --- a/Documentation/admin-guide/thunderbolt.rst
> +++ b/Documentation/admin-guide/thunderbolt.rst
> @@ -294,8 +294,8 @@ for the retimers::
>  
>  This enumerates and adds the on-board retimers. Now retimer NVM can be
>  upgraded in the same way than with cable connected (see previous
> -section). However, the retimer is not disconnected as we are offline
> -mode) so after writing ``1`` to ``nvm_authenticate`` one should wait for
> +section). However, the retimer is not disconnected as we are in offline
> +mode, so after writing ``1`` to ``nvm_authenticate`` one should wait for
>  5 or more seconds before running rescan again::
>  
>    # echo 1 > /sys/bus/thunderbolt/devices/0-0/usb4_port1/rescan

-- 
~Randy
