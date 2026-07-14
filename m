Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7005F28469A;
	Tue, 14 Jul 2026 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047677; cv=none; b=CfBIvqBQPXiAkjmXfB4ihkuKLaB+ncBCn1SFvDTifuc7A6hs8Bgnv6tAmaxXKfgF1UUr1HocWeTjRP8XPskfq9jyIs73KlKBArFd3XsBnUXXGRzmkBiyn3r/OnLNtMbHy8bmo7+w+MEwqHloptChAD2ps3mJMoRJfOLNZxmGwU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047677; c=relaxed/simple;
	bh=ubt4VVxn8y3DOKHUKqObxBTNY9Yv9liKtbacDOKpd9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WuXhI5G3XYwdy8ZPME++nv//J76tIZ7YxmyjUdHZknRAQ5BNUp4JR17g+8qIEaP5ELqgZLrVDwzy89PRuvGiRJCLfujR7Q9vNGsdwzpGA3shfHpObLE0JFkoiNVpTLjpa7dydNx4TgyXk5lBa0TTWjLGs75wMReSKTyXApSsRK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from [10.88.16.7] (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 1FFF323374;
	Tue, 14 Jul 2026 19:47:52 +0300 (MSK)
Message-ID: <c6f52685-dc01-7f56-a5d6-60257259eae2@basealt.ru>
Date: Tue, 14 Jul 2026 19:47:51 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] usb: typec: tcpm: qcom: initialize currsrc explicitly
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 lvc-project@linuxtesting.org, Casey Connolly <casey.connolly@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 "Alexey V. Vissarionov" <gremlin@altlinux.org>
References: <20260713182500.GB22956@altlinux.org> <alY7G3egPqw1iaPR@fedora>
Content-Language: en-US
From: Vasiliy Kovalev <kovalev@altlinux.org>
In-Reply-To: <alY7G3egPqw1iaPR@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/26 16:47, Fedor Pchelkin wrote:
> It's confusing a bit.  Maybe [1] should be respinned now with
> currsrc = 0xFF or whatever?

Thanks, agree. v2 sent: 
https://lore.kernel.org/all/20260714163913.151008-1-kovalev@altlinux.org/

> 
> [1]: https://lore.kernel.org/all/20260630120114.185169-1-kovalev@altlinux.org/

