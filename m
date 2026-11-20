Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175709;
	b=nDF3/E4gTR7gpGzQHC4Cg/Eh/14H+Urjahi/WthgjSWmmvTl+aUO7STrOxM9Kqj2xFbC
	 /pzfed9uT7CyKj+3pwtan2FgdEIsvlz1D1ktn+byK3th+dtJ8+Crw0Cat2eL0RNXtXio6
	 apjzdkV9m3VP4p1ZN49l6IE1NthTLMoSebnnZLWPxkXmlsfC10X11oI/+0/QCNeDY9pFb
	 z8XbihUptE6TnNiVvEshAUzsNRJwsp7CHLqtEUCeJngZAdWx73Yc6xLL8G3vFOpK2IJqq
	 sFPgvk6XPVKi5WPvE3LD/mP5DeJly3gBji9qXAI0b8MNdFx3BzMLT7qzRrgBlQda5vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DKbl0knP6GgOxKbGkSb4++hb3MG0vuwY2UQuP6+FkU0=;
	b=AQLx2Yo2CuADMmhD4N2QxT1UbnBqC777VUm3EI4Om6F/YhJMUpudx/cCwi0hUL1dHYkE
	 0oupTOytEBz0jfjwqfJ3gXvPl5wpD7qb0JmB5xceMf5uVtRh7uKrImmwtqWov94BZq9ic
	 Y9iyA1leTg/zl/kyZnCEIE+ZQ8rOUP8I1ceIvsIjH9AoCx6DRTypqS3v5hXLHcmV+md4j
	 sh+KPzSddrJzhvkTdQXPRt3XqhcsB0MTyemDHQcymR8YeEtScmJ0jTPMMxyCY8OYbYi0e
	 /jHMwQHGagx/wB9yRgk3H5ducy/7fBfiu4K9KTDY7w8G0oFJ40BLHbCfV74MVbdrc2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GyXb+xmc;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2092C606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2092C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GyXb+xmc
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so187827f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795175707; x=1795780507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKbl0knP6GgOxKbGkSb4++hb3MG0vuwY2UQuP6+FkU0=;
        b=GyXb+xmclUqFDKryhpi5m9OwUGqPa4BDct2MsTkMEVQZEKVA4q2M6taCVZK0xO1qYU
         qUTlfDVTZ1MUbljxTZenoZadlHfR66fREGrAZwK+YSQ249wZ7MwFiUODBayiFQVLSrJE
         MqYh3ZGOMrkvwAapQ30QHq43APGtlmrIJqSolgeLQoJ/KbGsmSxtI9XTWUBp1i/ooRJ9
         Zy/UfwA7Ecr0Hn2E0Z6+ZA+3Wb3JNDaXwVt0UTvt3FuIey0wIKUEpW4R8mWttlsuvs0n
         b7Tz66g2fDFkfzwE4AhYt1DKn8sl08PAlJSZFaKI4+FOlcRs7xVmvxbGuQsrT+M2bNiD
         uVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175707; x=1795780507;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKbl0knP6GgOxKbGkSb4++hb3MG0vuwY2UQuP6+FkU0=;
        b=jpFfOZ9mxFxif9TQljslfSMExudmSTvK4NVUE6p0zEVP9+PXStJvBdUefuqFD17YTK
         24+V6CMLUIac5yWejZS+AxNWwfyIc3EF6SGEmI3yy5RnHTY+Vx7cQQRyRhKTCm0N3tEl
         BY/vvleGgk6teFi2ctAiavEuej1yMyb2YUV0Dbr4Yn/t2JErqHgJPHyfUzZ/R7bm+DO1
         DjkCsX27aTGeq4eYV3TYdUup3K74jq6F6uJEvm00UkSz2apvF/68V94AXYHa0DVi3SNl
         3ODmLQxKcG7JP5mVaG9WkPNkoGKg5Tk/PXOW3kiZCDmq8W/eQfpYs8mO13DVcKZ174Q7
         ej4g==
X-Forwarded-Encrypted: i=1; AL+hErFt/BHX0WaAojWFT6k+eiWk/QZ/DKsL8XIHAzJLiCOYpmSFYSXW7zSCwLI/jwxfXZNf4FQPtrvPTaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xKeII05zEnIetGRuMnD7BawrHzvyyiJEfOqIQ2VQ3YupsuQ4x
	km+NLWek1OlkAx80A58xM2B1l/qURIZiYMXVoU5XArylU0/O+5v1jYBBHsyGqsDmUCs=
X-Gm-Gg: AZFdTZeJHY070iDpTYiRASdQbEb79vvQdQQ2HyPhszpW5nVZYU94ITuIEE8iIAVP83x
	kgzaauLVREK9cSlXjEiJ1PrbSiuOm98UkIDhgEs5HkbKyiyUWDBeoWnlt9BzTO3v7rOHDhvFceT
	2Qg7SB/GZ8PLMk4zd9bjcVyJKsDZpXLuNy/Pzbj+rUyh59E10ObT3kXT42L8RwNFeSAlxKSh5Y9
	YaJtoPVWs+jgWp9nS0w3i37jIOPJTzhFZMDarjO3yJxG9IvGyeOsQi9zSnLxDZYQIGTxmZq99iz
	zysj+a0wKftfSGhE/f2U4/4wmd9gMDRZf/UVd/FzbXqj81FcesLaN04+Whgn0w7O/Frc6/htuSf
	7YqJKv79gEvaQinWJeKT5kr0fZOvtYu3YZgHzlVuvr9unuypJB1cyYrY1iiPoRUfRVwoqsLyECT
	vXFetk/O5J6zmWSruzpo2IUSMSb1lt0Okv56nkO7PTBdCvz9ib7xUKi7H877qMYXQdO5QufuHaG
	ZbfRiIy1xaqJ+WBDmvwdzdjTIBB1BWKOHCqkSx5UOLhwsu6LIPZDKs0sVYsEofQEoGu0kFpP+gn
	VCfyp/sZBxM1IQks2xW+uFGcwii03Dgc7RQrYk+8ckEJgFtIeSGrDAqfqlxyfOU=
X-Received: by 2002:a05:6000:2c13:b0:4aa:874c:a1c7 with SMTP id ffacd0b85a97d-4abb86ed79amr5274202f8f.43.1795175707432;
        Fri, 20 Nov 2026 03:55:07 -0800 (PST)
Received: from [192.168.0.167] ([109.76.69.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm5834751f8f.14.2026.11.20.03.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:55:06 -0800 (PST)
Message-ID: <2612ca00-602d-4a4c-95f3-39cbadee10e6@linaro.org>
Date: Fri, 20 Nov 2026 11:55:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: typec: qcom-pmic-typec: detach the port on
 shutdown
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20261120-topic-tcpm-qcom-fixes-v1-0-9a152f906fba@linaro.org>
 <20261120-topic-tcpm-qcom-fixes-v1-2-9a152f906fba@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261120-topic-tcpm-qcom-fixes-v1-2-9a152f906fba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2026 09:59, Neil Armstrong wrote:
> On reboot or power off the port is left as is: a source partner keeps
> the negotiated contract, possibly above 5V, and a sink partner stays
> powered by the OTG boost while nothing services the port anymore.
> 
> Add a shutdown callback stopping the port and the PD PHY, unregistering
> the TCPM port, which turns VBUS and VCONN off, and finally disabling the
> Type-C block so the partner sees a detach.
> 
> Assisted-by: LLM
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
