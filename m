Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D6F273D77;
	Mon, 13 Jul 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.43.8.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783966987; cv=none; b=mIpAd0JKoMAixm6helamx8d+tz6Np1i29AjYAiclbWt8EGYqF65LwtqXhnBfXNDZI1JJEaKjFnnq106VhdCy3ZBfYC7aHKGHp7NLY/fU7moKJKH9oRCDIklrwYrGA9Yn1jyvChghYKj1QOOuMDvt5SACOf7Wo7BesfZWkUwbtx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783966987; c=relaxed/simple;
	bh=Zn4gdLOfhoOee0jEfGwXihAwW7drfLS1Wj0xCLzHM40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1ba79IPVrsH/FVHNTgkdu2uF96PibpskromiV8dnLowLYNtYn5OsjcIxY1nh9DBX8lLWWLgU62rrqrpETyGJHimX9tZqGhdwEYCczPD5ITywOsfFBCILsVHpHGKczQSYNhyZuhpLSZSG2vbETFR1RjVoPhKjnxWwwWAq4fAwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basealt.ru
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 6E84C23370;
	Mon, 13 Jul 2026 21:22:58 +0300 (MSK)
Date: Mon, 13 Jul 2026 21:22:57 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: typec: tcpm: qcom: initialize currsrc explicitly
Message-ID: <20260713182257.GA22956@altlinux.org>
References: <20260713080631.GB1275@altlinux.org>
 <a205f7ee-7894-4d6d-a752-b10b036b6c36@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a205f7ee-7894-4d6d-a752-b10b036b6c36@linaro.org>

Good ${greeting_time}!

On 2026-07-13 09:34:22 +0100, Bryan O'Donoghue wrote:

 > On 13/07/2026 09:06, Alexey V. Vissarionov wrote:
 >> When regmap_read() fails, the execution goes to done: label,
 >> where currsrc is passed to rp_sel_to_name() and used as an
 >> index after a proper check. However, to make this situation
 >> easier to notice, an explicit initialization of currsrc with
 >> obviously impossible value is suggested.
 >> [...]
 >> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC
 >> Type-C driver")
 >> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
 > This patch makes sense but doesn't require a Fixes: tag.
 > With that changed.
 > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

ACK. Updated patch follows.


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net
