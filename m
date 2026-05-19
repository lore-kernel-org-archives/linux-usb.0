Received: from s1.g1.infrastructure.qtmlabs.xyz (s1.g1.infrastructure.qtmlabs.xyz [107.172.1.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BE7369D67;
	Tue, 19 May 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=107.172.1.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192096; cv=none; b=cnPRHDJ7vYdeL1XcfTJI83fQyGe5RiUocM7R6Lpyp/RtGbDV5nw1eNqDbw4wLEgjhlqEaAHM7yVCtxKZbaQzOaEnkvh8Ypyg731S685YQNexYprRRQdtdFtLvFMvY0FQiGywQhB8JJbl4VcU4vH3mnSf2LSDfPwA+RrpRxE1AbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192096; c=relaxed/simple;
	bh=PbnePNJIeYeu+YH1fX3BLX4andq4xF/Blf02C82A0jY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ryq1g37Xziml9a9cLDUi79XGCpRSwUwTXvkQxTmIEpKdD/MxxaUvGKJboRO6lnAzmSyJReq+G9ul/RDmu6cRFUMCtAf2oIMIyOAsoicuzLISQ29ASkSclNv7q7VbZO2PnCYmu1RUykB4G6S8V7nHBEEsyNWglgEL1xgMQgssd6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtmlabs.xyz; spf=pass smtp.mailfrom=qtmlabs.xyz; dkim=pass (2048-bit key) header.d=qtmlabs.xyz header.i=@qtmlabs.xyz header.b=NcveeNw1; arc=none smtp.client-ip=107.172.1.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtmlabs.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qtmlabs.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qtmlabs.xyz header.i=@qtmlabs.xyz header.b="NcveeNw1"
Message-ID: <1d13382f-9b0c-47bb-8939-36f0b03c4dca@qtmlabs.xyz>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtmlabs.xyz; s=dkim;
	t=1779192088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=whmZA3inCpFjdOqJD6PGEGqTrzENRDqHE3aIuWUiAb8=;
	b=NcveeNw1V5xZTa3QMfNNFF6s8cbC1ZFA9rmKnNi3t1iFwciXeKrqvMeUx2OPOsSrmXYw0f
	hs5HcDKzVu/ulOZm0sPo+IE/mDaBOCcFiwivj+jCZC5w9VTtvjSNGKqsk/K10AnA3iNTwk
	GV1/fcgF3QGbbGSFoOqP7azD0wxW2jO305144lz5b8/R4xBoo+HTF6BXbj7fS0UuWUdN8v
	QXIHipUdJW0S3UPDSmFNdySJZsp7r9HwOfD6Sj++slJ6UeZhnJcn4Ekn8JUvjvq4VUu5br
	Ka29yUIO33jczbI7hS4HOsWix4N4N9iymL8cNZVHDNQezsNkaMvkS6+UHocoFQ==
Authentication-Results: s1.g1.infrastructure.qtmlabs.xyz;
	auth=pass smtp.mailfrom=myrrhperiwinkle@qtmlabs.xyz
Date: Tue, 19 May 2026 19:01:18 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>
Subject: Re: [stable 6.6.y] commit e613904fa419 causes suspend regression
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <agvqqMt9x0df-WXS@google.com>
Content-Language: en-US
In-Reply-To: <agvqqMt9x0df-WXS@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: ---

(re-sending as text/plain as the previous one got rejected by the 
mailing list)

Hello,

On 5/19/26 11:51 AM, Sergey Senozhatsky wrote:
> Hi,
>
> We've identified 6.6.y stable commit e613904fa419 (usb: typec: ucsi:
> Update power_supply on power role change) (commit 7616f006db07017 upstream)
> as a root-cause of suspend failures on some of our laptops.  It seems
> that ucsi_port_psy_changed() causes:
>
> [  309.858915] PM: last active wakeup source: ucsi-source-psy-cros_ec_ucsi.3.auto2
> [  309.858917] PM: PM: Last active Wakeup Source: ucsi-source-psy-cros_ec_ucsi.3.auto2
>
> which prevent laptop from entering suspend.  Reverting the commit in
> question fixes the issue.

Can you check if this patch series fixes your issue? 
https://lore.kernel.org/all/20260519-ucsi-fix-2-v1-0-6f1239535187@qtmlabs.xyz/

