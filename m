Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A02B3644C7
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142173; cv=none; b=tw2gfPkSXHRlNknQk5p7aXHc0V9GTKkQMNHdBd/xUYVToSDEr5Qz4JMK1KCZFL0GLVcbKtKrdN6Ns4zle6yZKUHzCwRVb0CWeYABOJfnQ8FpqXMt/oD8GE3TCJRD3AO2NYZKN4GI4DZHT48BqBWwqn18rgbuSkidjwRG71E6n8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142173; c=relaxed/simple;
	bh=m+DvEjh5e50QoZEQpu7fp79r2/ZAEXh0/plL42oC1Sc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JNwgD9Hbll2j17lDKU6dsIbpPT8vVG4sXEAMZfUYiTxiTQNJ1TJeD3HAlFvoJdJ19V6r/1YWyemJTJm1w8i1fF5u3pvGNaNI9euLvqB8Ob2Hy20FIHejqgFqXZ78qyrBSE+EkKEYFtl49jDvy5YRPP5+jURTa0enSUFtajeNsxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fnfy4wsP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fnfy4wsP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0046078so25762805e9.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 15:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779142171; x=1779746971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m+DvEjh5e50QoZEQpu7fp79r2/ZAEXh0/plL42oC1Sc=;
        b=Fnfy4wsPDmB6YFCkVAMazIsBdQEjB4Gdt++18XBjAI1HEJvEYq7ytCrXQLQ+yt0Lml
         rM31JHMfkWaZi7Dq1cKCdQFjJWANrhavO/wYevENmfVQbHwusfqW0UJ4C8xYEzOE85m4
         m8idBcL37bUpW3Vs7+Wq9rW/mgcb4iLnZQKie7apMcKatUVM5ujzd27LaT1j6K+JsAX4
         zn0OdUaLpBNnIwSaewVdAzKEtO9ZfslBoXtKT62/F3z3RIE8RJamUYKTbOGaMRsxguEE
         L9vepsRXd6+DtKMeeVst86KPob98gbpt2MowBObi9qlfpj2D9gbkx2LmG4ghlwIeoHRq
         8HOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142171; x=1779746971;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+DvEjh5e50QoZEQpu7fp79r2/ZAEXh0/plL42oC1Sc=;
        b=G/g3eP7ka6nuxV4LUCKRj7vQ+dVBWERlW5ox8jnguxPco3r6b2Pj2tet74DgO1FEtz
         PsjYjsQM6eTOaDExEp7Kb70IgQaV/BgEGim7ndT8yYxdvuLkKdHIbUEOmRfMccM6dut+
         jpAVlFg0b0yFgEgsKzzGI/h90U/kOMCBLMMQOO0+npegEo2TndYsTBWcaxzKoUKfFxSP
         AK2gDoEXGudrn4dsD2gxIBdoIf1paSq04zFFnjBcQxj4C091rOCpiEegwzUmJ2oLI+qU
         OO316wCfy0SFxtoJj9Wn57hbjW0MCwC0qrBfGwW21500unIzg84tFipV+H8ILIR57YUa
         ScVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+C3J/p+OSgkfW5s/XdswQheob39mhwEDHqoeksiSS//LXXoeaZw61iyhvzSaTQwRKbUwm7N20WUxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqN5lJzOa3t8PipbstfTqt3doAs0uYrEoVfUy9xghEuh0nkYlY
	OU7jrrVe7WAKqbn6w/+37cVQ5EtJXfC+8UZMfd1dALAJl4ZaZbMe0qnHcoKfjNjxyBsAfpwD6/H
	ikf9tIA0=
X-Gm-Gg: Acq92OHjREuVNmQzHofg9vGrAHUMSy0Q8JuLV+7u90DM/2bY1BfB6xPsM5OHSEEd0qR
	FOPK4iRjFf6twJk7dua/CFcQ0Wg9s01rjgnGcUhrFoODmPxNifa+YhHJhexABYE5ozEZkG/6Lto
	CnfCyz7zeOd0B7kOj9XVYowp5rGQIBmvoS8UO/mZbNVWiVux+9JKJYghI0MqYz//S8sewMW7FEe
	DsytJQmG1myTBrqhAwVFyusMVDaaJ/fPutJc/4Ox7o/d37dSAc9MOxD40fLUxieyYQBobo46AZj
	FdYGLwJBDLmgn7JnUTHBhWlbqF8Jp3sog5B3OSHT4x7+uJyNsdyqbUwYEeEdzKEcxhlW7SIyLUu
	B8YO1N/omFIIYZFaNxIAOk952+QEvzNR86sOACHv3ld39F5l3MFmtzimfYnquq0Ik5zFqPDLR/J
	4AFl0R+3FVY9iGL5SntAMaEzeYbqsiDzqkqoTYK9sTtSw=
X-Received: by 2002:a05:600c:4e02:b0:48a:906a:9050 with SMTP id 5b1f17b1804b1-48fe5fdb076mr267945245e9.10.1779142170621;
        Mon, 18 May 2026 15:09:30 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00bbe4sm91333105e9.12.2026.05.18.15.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:09:29 -0700 (PDT)
Message-ID: <c1b0347e-0f90-422a-93d1-eb1122de2292@linaro.org>
Date: Mon, 18 May 2026 23:09:27 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <cover.1779127507.git.taygoth@gmail.com>
 <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
 <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
 <d15b138d-8c6b-430b-bfc3-f410b05e4835@linaro.org>
Content-Language: en-US
In-Reply-To: <d15b138d-8c6b-430b-bfc3-f410b05e4835@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/05/2026 23:07, Bryan O'Donoghue wrote:
> along side the pmi8998 logic.

*pm8150b

---
bod
