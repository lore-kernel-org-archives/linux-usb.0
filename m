Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABAC483BC6
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584864; cv=none; b=UolmgXOE2qVtviKkSsxRoE4cHC615dcXWPFPdlvtaPNNU6PN5i9RgltyesoWe5I/cJNvyohSXsCdl8Hab94DtKf5cz6uWuDbCs4Idkw7CB0zgszdEjNL6JHM09rX9uKGyY0DL3/wX2RIBynj1LOVIUKaNxi6ngXdr5YWKMdKdX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584864; c=relaxed/simple;
	bh=eCSCZBF+4pns+bczZ1yHJAcSNTHa7lI5eyQbeiGzGwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZTj/HjTIN0C0ZKRi5i8Menqt+85FMkHgYh82XmLe52c3xZnKcqi6I8hUGUJi/KozcB374hhxB1sPpWp29/fp5pbogBhpcf42ZLKXc+UqSaquTzbr+2YxN9mgO/xeazu8lvry+YLAGW0ItcsfWjz4qo2Z4w7Rojxs9iH/s0gsKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEnsga3R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEnsga3R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201571F00893;
	Mon, 28 Sep 2026 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584862;
	bh=6fKTVmKKRk+yn0p77ZCtXgKSH5G2BB1OLI5uI+ZCch8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kEnsga3RR1Wvj9EmuVcLELujtjXedynhUwnKKYOrVrVfTE7uBYJ+sZFCYkbrClwxu
	 Knvk8fS2S2mIYjOB8Ymw7zMlV1nUWbxPUijKFOg7FNwAHDzuwrF7M680OHSboZYhNT
	 JkmNktQKL6L9BDsSwDCyv7DjYNeMxy5L/UuSNwQsLb5LP7y2ZFOTbn3sRmHYuxh1D/
	 GjMtq37jOSAyCq6kCcaI2ZW7RYqza7SxXtWP3MsRetWkfj1nbLSLm5VUnFOvBiKMio
	 RGSwlwlTkxoDD8niYDLScrzEgQ/nk0N5B6vYXUjmYldBpRnb8bz2Edg4eHfai/JWax
	 Qlrcszm0zj1EA==
Message-ID: <8efda53d-3f18-40e9-9c16-92ac2f5c3133@kernel.org>
Date: Mon, 28 Sep 2026 10:41:00 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Update usbio driver maintainers and
 reviewers
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Antti Laakso <antti.laakso@linux.intel.com>, linux-usb@vger.kernel.org
References: <20260803164533.58833-1-sakari.ailus@linux.intel.com>
 <aromZGGDP-rTsNCz@kekkonen.localdomain>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aromZGGDP-rTsNCz@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Sep-26 10:33, Sakari Ailus wrote:
> Ping.
> 
> On Mon, Aug 03, 2026 at 07:45:33PM +0300, Sakari Ailus wrote:
>> Israel's e-mail address is no longer functional so remove him as a
>> maintainer of the usbio driver. At the same time, add myself as a
>> maintainer and Antti as a reviewer for the driver.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks, this looks good to me:

Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


>> ---
>>  MAINTAINERS | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 88de4216d7d4..d1c26db44ca0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13430,9 +13430,9 @@ F:	Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
>>  F:	drivers/platform/x86/intel/uncore-frequency/
>>  
>>  INTEL USBIO USB I/O EXPANDER DRIVERS
>> -M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>>  M:	Hans de Goede <hansg@kernel.org>
>> -R:	Sakari Ailus <sakari.ailus@linux.intel.com>
>> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>> +R:	Antti Laakso <antti.laakso@linux.intel.com>
>>  S:	Maintained
>>  F:	drivers/gpio/gpio-usbio.c
>>  F:	drivers/i2c/busses/i2c-usbio.c
>> -- 
>> 2.47.3
>>
>>
> 

