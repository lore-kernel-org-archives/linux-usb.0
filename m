Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79A0411691
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221121; cv=none; b=NCmLgQfnJbA3XNAw/2QogNSIlcLZA8uDZ/xueaXqnkNQ7MtBecGQTtXBu0ZIopBiNzcTnVYB+RUzyo19k34HNHODqc/NaQXkbNEJEItyjb1OWEZBWdRbn8kudKCqjLJMFXorBGnlmfLvp8zey1AS1m2Tf//fEjalR1twDoCKDs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221121; c=relaxed/simple;
	bh=oU8Q8cxZ9N9b+kZmjkv7HR2+ZdQQqp1Cz2rEVM7YSDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u54Z1rcQsuB/2nPjYYUL8fq9VMXz55JYBn4fkc0+2s2F7fiKP7G6muLCK6L15ucTJyDK1S4SnL/1JmNoDioLEpWY+ICniTIqixikknt1YxLsmVhYBGiXQ1rURKEDS04PG2lFWj8tFgRiJcIKvr8X0hTA+JLXUJ/cJoULEdJ5MEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dj2HhQg0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dj2HhQg0"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-481412f1828so811565f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787221113; x=1787825913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jTRsDr3KJBScAQEjpdGgc1pnZRQT2r5s5VcOgpe4HIo=;
        b=dj2HhQg0Ugn/oZ0IO4A7m3B6+q3WUTqn2iVFeGDy5o6HM8tawbZ9BKIpZq/K4ex8md
         TGy0Uzt0rb/KterUNN61Hm6014ZcCJyNlSILbBOWyBHSPMDD6ER2tD3JIDtU4Wjpb1O9
         zjkDikGeYfdZkuu2et8GdGPVJkW+nWJFQeWooYsSPaxocu1Wn5q23AUvVg1xIyu/32Bl
         qlXh/bt4jOBKr+T0DuE5QwofJrrfDTdEko9r62+dqmIfrDmvwZ/2VLoS2EqAr95prRNW
         CqB+JPUP3exlldqo3zfz60Un18pxjw79qCL8OSvmSLgPjsQrOWa/HUlISosLYRlH95H/
         u+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221113; x=1787825913;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTRsDr3KJBScAQEjpdGgc1pnZRQT2r5s5VcOgpe4HIo=;
        b=RnsTf0ygUbAjIM7/lE9cQQfFGHDcmhDZ+rQLxsLMg9o+oKLWkQ1TxpVeVDisAt+PJA
         iwmpgTByKtGi0yJzb0yXGGb/JAC5GLgep3Qcp++cmdyX0JQ8Jbeu2GLN2I6kyhXZZLGN
         sHZIJdiRETRYDdb7orGHiMReZyVcwxXDubCJ5lWr1lNW+IdnlGgrwa/tgGVdCmWbFvN7
         5MFe+yr97kzlUs/PjEQhyvl5ez0+s0regCTGFqkZx+hdj9rQHjr8krPL6fgCZYr9uJPT
         LToY3dGNX4wF++kpWa4CgzkgP9qAnjJ7ePAmWLPdDnsQ1Fo3WkkF3Lm3zRv9eKIVB5KY
         +4Cw==
X-Forwarded-Encrypted: i=1; AHgh+RorwZ/KxsLtGSPTOQzlI2AX3Y06r+qmW+dGLDzjBwrSpKiPUV8tsRu4fjTYTiK4q195yGg+3KPdtfI=@vger.kernel.org
X-Gm-Message-State: AFuF++k0zwxIRd7hXunwOifCPY/ecY2os9UFa8CmVkeGAm+MGn7AUKhB
	X5hkTlKjmxGwzTLdnXP66JFj+2gIhbLfk9vsym5g7IBRDwHn+5WIjdwns9SvjglPT0s=
X-Gm-Gg: AR+sD11Uq0SGkZodVF6Zi7U+FuU/L+d9NwrnBkCZCFX/ZXe2WzrlrtyRo2Qs7vBJicu
	s8lnULYlVbup73/qxgEejo6sXljt5LjjTL+T7SBtVxeVCyH1IUOCw+djlcbzn36aR9zHMGEX8Uz
	EYetwje//hZuCUTPRJugDV2J+Logwj5JDSJxMfVztsho291sDukkys69OBHbn9+nwTEV36dtTok
	yNsiwKUFyE1krqhYZYYQsr0DDxo1Z+ZIFabY6krFm9J0C/VGMlp6vZ0/eMauIQMYU15BUFn2nvZ
	MX5fzkewF6IgKAnl/lx80VH7G6Ql+rPpXxPrGH1MxwXJ/K6K3Xo4zm2CADdNuGcAb1C+iGFo4nu
	oB0toFUblVX4p6HuZM4Ssv5qdoRAC+cO6IKU2wq7ZUKWHBrntLkkhhyCNB5QFJQPyOsLoYFL6TI
	u0WZhu4tWNvzlLgGD83pCWG5yvXjz1WkoJdjUpF/fHISSnBFYdnwXybmOza/w6+vMctmJem38j
X-Received: by 2002:a05:6000:4918:b0:47f:8b9e:f44e with SMTP id ffacd0b85a97d-482b1fd48e7mr24038240f8f.12.1787221113240;
        Thu, 20 Aug 2026 03:18:33 -0700 (PDT)
Received: from [192.168.0.163] ([109.76.167.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c33b3sm10947026f8f.27.2026.08.20.03.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:18:32 -0700 (PDT)
Message-ID: <3662ce56-7471-491f-b2db-7a87a4379099@linaro.org>
Date: Thu, 20 Aug 2026 11:18:31 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: disable cc_debounce_dwork on
 stop
To: Fan Wu <fanwu01@zju.edu.cn>, linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260819161950.77858-1-fanwu01@zju.edu.cn>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260819161950.77858-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2026 17:19, Fan Wu wrote:
> cc_debounce_dwork lives on the system workqueue but is armed from
> tcpm callbacks (set_cc/start_toggling).  Those callbacks run on tcpm's
> kthread worker which is only destroyed by tcpm_unregister_port(), after
> port_stop() has already returned, opening a potential race window where
> tcpm's worker flush re-arms the work.
> 
> Use disable_delayed_work_sync() in port_stop() to cancel any pending
> instance and prevent future schedule_delayed_work() calls from
> succeeding.  Also unwind a failed port_start() through port_stop(),
> which otherwise jumps straight to tcpm_unregister_port() and leaves
> the same window open after a failed probe.

I'd prefer to see two patches broken at the "also" in the above statement.

> 
> This issue was found by an in-house static analysis tool.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org # v6.10+
> Assisted-by: Codex:gpt-5.6
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      | 3 +--
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 2 ++
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 35320f89d..f42c9e65f 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -101,7 +101,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   
>   	ret = tcpm->port_start(tcpm, tcpm->tcpm_port);
>   	if (ret)
> -		goto port_unregister;
> +		goto port_stop;
>   
>   	ret = tcpm->pdphy_start(tcpm, tcpm->tcpm_port);
>   	if (ret)
> @@ -117,7 +117,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	tcpm->pdphy_stop(tcpm);
>   port_stop:
>   	tcpm->port_stop(tcpm);
> -port_unregister:
>   	tcpm_unregister_port(tcpm->tcpm_port);
>   fwnode_remove:
>   	fwnode_handle_put(tcpm->tcpc.fwnode);
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index 429bd42a0..fdc379fc4 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -694,6 +694,8 @@ static void qcom_pmic_typec_port_stop(struct pmic_typec *tcpm)
>   
>   	for (i = 0; i < pmic_typec_port->nr_irqs; i++)
>   		disable_irq(pmic_typec_port->irq_data[i].irq);
> +
> +	disable_delayed_work_sync(&pmic_typec_port->cc_debounce_dwork);
>   }
>   
>   int qcom_pmic_typec_port_probe(struct platform_device *pdev,
> 

