Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687787;
	b=4UZDPkWQC4IhSfAXHbPqdK9Lk0QRcWh1zf3VbeOTQ978CKJgGyC7uLaQ8BcVyUyFQkZi
	 9puwTpF5pLMpK5/7Zn8qIKKpyc3OG6MCASI/ApN8sHVJF6+MmJN3l8ywK395eYRlluUW3
	 vH/QrK0z2Nt5L3XA6O7GouilM6Y5R8+liQzQsUhgC8lB2gxXQGBzGeUL4eC32Kj74LQhV
	 IXNeNSFmYVTLCkxsGX5wSXaC1BHfsJteE14Exw8pd+N8lmU3J9PdlzIUJmukvknOjLm8s
	 l2Nx8fJ16iLwaYHFCKN+1OGDRjsDrKA79ohz/angRHrm4MxJHZAzXxFPRbD6369RsYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687787;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=loZ7fvewUFkTUvocMqnR50A1uxzYVYEYXlUEQIL5iLQ=;
	b=nJt8CcLdhLTi8C/vzT9POFcKBa1ocsIHhK/gyRNQTkAKcknz/H12IxuSFpTB6nA88vIR
	 JiEkNdinddT3tRnO+Ym753RPuKrePWy23BNKMuj+LTyCtTJf/z0oZaL6VEgz7UGB2p1Tm
	 Ap0uW2d+pg9tPOrN2VykMes3f0kwynFqFG6kTDd8PBK6VkWLH6MlLBkoOBTO+qRFepTUI
	 8DklN3ntJjptESw6qhGhJueZDvOAlnv7XdSQWKheiqsGhxKJ2RPtOIO8Y6+mxAFOm/Bgo
	 6skALLbWOKJmttdWJGrotuG+NP1lQ+RXo31iiUYHsUrvfpfyN6NnKje6hYrwUaa7byQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AYzEvUxa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsHIKUlS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09818606A323
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09818606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AYzEvUxa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RsHIKUlS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Aw7N695029
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=loZ7fvewUFkTUvocMqnR50A1
	uxzYVYEYXlUEQIL5iLQ=; b=AYzEvUxaxGxo9dXUeN01Az+GmCV9kFnORkK9OZq5
	7nWXjsCEZ8yf/sn+t8tQmm/G90HafklyCj2n30HQUiyL1QnFGhTkIjPbtKRs+JkP
	m3d/oxlvpMNgg1+o5RmK/nQGBEidEFaXSugoXkJX+nrHgE4bAUcZyDsQzS8ni88W
	/VUxWJKwqeKGT7vu5HcSq0Z65NMMhekOVRhx2508HS4/xBdjYECNzYgC7q3/1c9Q
	vsG7Dj6im8VBCnwNrg4NkXe/VmkoxeRlHOfF1yTWn56TGzoriDc43sZbv3LfTQyY
	WCm1GYR4W5tmozAf2aYrCbwNeHnVppm+t0CeNQXV7AUC+g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7rs8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 10:09:44 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so4009399c88.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 02:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687784; x=1796292584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=loZ7fvewUFkTUvocMqnR50A1uxzYVYEYXlUEQIL5iLQ=;
        b=RsHIKUlS7/pmPZpMe6olPALgyIbmcv5Xp0WnbJY0u69LET704NuTjm0E+37vth2YRZ
         AJ337fsgTVb+YG0VV4G8Mjn2stcL51muFVEgf1nHeagXg78w4gBggHQj7b7MeDEjFvyh
         JxU9N64MMJTof+N+I7jzTv/7tkikSuCMCkrnMyyaD0zngwqDzB5ruj65vmraOMNZTl6m
         6ljsvFnycNa3QqVtUiCfAM8hABqacZd8h+QpjJEXK7VMt+mdi5nxP2qdxt07vYZl8orH
         XJEJcRmjinCC7bQqxWZNtrrs5Z4CFQwXP9WNYXOGlRlQvVdO56Y+dEUzsKj9KB7kLEwY
         cmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687784; x=1796292584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=loZ7fvewUFkTUvocMqnR50A1uxzYVYEYXlUEQIL5iLQ=;
        b=Kh283jcGMiFmRK1ACBPLhVvHyCTas70WWGofWGpnGwfOXqLNKFyqFBgyGjLbZZdKvZ
         8Vv11FRDH2MQaIGb4A8Zx/OgPKj+WuLH4h8m99zshKSTvQowMtHc6ZlzbqEzD69D2SVr
         wu8iaiDJvoMiHzkDfPoosS8490fW1rusuEnYXR8JX4fJ3jNyNV++hJuSHGf1IjdHnmCZ
         WAs7/pcfrYu7BhfeLE9IyXtw0NmHtqGJLUQKEF/20KRUf6SVKv8DUG8V5ZZEIZAaTO6M
         As3IJPnT48areiGKyuNQgiJsNPtXe0kiIPECxJWAtSNvAiJvBBmdlInoqapwGvkrQXkk
         cHJA==
X-Forwarded-Encrypted: i=1; AL+hErG0JGjpI1iB8HyjfNLg5E0CI9/JvWDQJ/6iF1jzH/4+Xy64/Q4hlmF62qdtzbrm5aSLPlxqejaVR+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bWmgWkqiOHMIh/LHtPbffjfhba20A1PCr0ykdVOeU0gSw+qHL
	nX4cuuvHZiIuWd3n+R7aygb8DDysgXhgW62R20kBSLRjoZp4TJmI47u5V3UIvWEKaKI0sDn0hkS
	PFeGL7qvCySqa+BEVcCZ6dlw6Mi17Is3bxuFx4v5olC8eVeJjF7Lj/+6dgIJHO7k=
X-Gm-Gg: AZFdTZfFRd135Vob/L+jemw6HjEoThyFpKf0N915Mym0MuGqO4P6MYGP1hYzVlBNtpS
	33nZVDBlYKEzjmwGeZIXheVZ8e9dtiFlcENQ9Ss8aSQxePJd442pBlNEb4ji8pp6RBdxlXn5ZJF
	CWx868WOEW09A8QiDkbsyl2lmtBjKcsBaknwCGEd+Yn6DDO3+WNfnv6rNK57ZRr8LpqQsTPbw4F
	x/XQhHKCq4ltPotya0UXdi5hPAmZTgzxdYI2PR8VpHhwaw9Vr84XAlPQRnXqcDlR7qgQo0LC5l+
	80R0trijpswfiePZnYmPCHvxl6dR01u5e7RwdLH8TCH/7dLPdkiVFGUkoHZ5lyzeZSAE3LpgFAQ
	ZyjOtf5BkACc3d6BARkKGdQZeTrYEDIOtJgMijFLL/AD0KKA63leYGvVw44oi8xVraibrnJ3h52
	O4GThuetBCuio2wfoM8YfS+l4=
X-Received: by 2002:a05:701b:204f:10b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b556903388mr20594609c88.40.1795687783627;
        Thu, 26 Nov 2026 02:09:43 -0800 (PST)
X-Received: by 2002:a05:701b:204f:10b0:1b3:a05f:892d with SMTP id a92af1059eb24-1b556903388mr20594584c88.40.1795687782932;
        Thu, 26 Nov 2026 02:09:42 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm54433026c88.6.2026.11.26.02.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:09:42 -0800 (PST)
Date: Thu, 26 Nov 2026 02:09:40 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/11] usb: dwc3: qcom: Support firmware-managed
 resource states for power management
Message-ID: <awgFZGS9aUS5Swnv@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-11-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-11-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX1Gsd+9IryO0V
 I0YGqQ7VEVROQ1JGVFteCZjKQ8ZZ4ZflY5DRqyBbZPTHCJp7sNpJbV4z638tJyaeb3ui3tgySNe
 5ljmP/3QLrh8xxcC5fJOzKYLYbTnpJ8=
X-Proofpoint-GUID: gdf9I-LFUWYdgiskIl-pLiBFByMldSnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX2X+6d6d1vyMb
 oKByqcngRNSnE5lMGRqWcHm5mcmLCy9IEi9QLZdrvPRerRjQHE1ZEB3qB9RKgYhnwnbyIKDAsLR
 sZgqxhwKmvGZ1J/8h9j+PzfDqSlWqqkLu9byyILvcymggYlJa1q1pDA54hppJUaGjnDNaA241sj
 7Eu/z4vazYY7ZuLXhgm+H+wG+s/YXsqGZO3AkdeZr8EOrPjXV5CGvtThl8Bx+gq+o14LaYArn2Q
 qRlbOM7zM80JsDZyRg58QsMqOOEPuiQzNISPtTFR7fYrKcGRlqLbHybdY6XnzLC2Y53qMCm+/9g
 SN5wDJjqlCN9qLMC7nNXAKPWkcw/RSklA7etDFu/8wfE2Z/6KeZQfA/C5QQRdKRUZOKy4gbxQUY
 TqMq8Rv0BfFPppBzqaq+5Ccbgx0vjpz2BNw4C3yOi4E59DWEUpCYcdmBcEmOiTP/f1T7aHvVW66
 4CLcx96mijzL3fjEtLg==
X-Proofpoint-ORIG-GUID: gdf9I-LFUWYdgiskIl-pLiBFByMldSnP
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b080568 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pZNOVp3z6k5v8D2Og3UA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260039

On 26-11-23 16:17:25, Faisal Hassan wrote:
> Add support for firmware-managed resource handling in the Qualcomm
> DWC3 USB controller driver. On platforms such as SA8255P, controller
> resources are abstracted and managed collectively by firmware, and are
> exposed to Linux through SCMI-backed power domains.
> 
> On SA8255P, resources such as clocks, regulators, resets, TLMM and
> interconnects are controlled by firmware. The driver communicates with
> firmware through two power domains:
> 
>   - "power": controls power supply (GDSC) to the USB controller
>   - "bus": controls clocks and interconnects used for data transfer.
>     Register accesses through the controller require the "power"
>     domain to be enabled.
> 
> The clock and interconnect handling in the suspend, resume, probe and
> remove paths is moved behind dwc3_qcom_resources_enable() and
> dwc3_qcom_resources_disable(). They enable or disable the clocks and
> interconnect paths on existing platforms, and vote the two domains on
> or off when the resources are firmware-managed. The interconnect paths
> are not requested for firmware-managed platforms.
> 
> The domains are voted on and off directly through runtime PM, whose
> usage counting keeps each domain enabled for as long as it is required;
> the driver does not attempt to track or infer any aggregate device power
> state, nor does it assume what state firmware or the bootloader left the
> domains in before probe.
> 
> Runtime suspend/resume vote only the "bus" domain, since the "power"
> domain must remain enabled for hardware accesses that can occur while
> runtime suspended. System suspend/resume vote both domains.
> 
> If system suspend is entered while the device is already runtime
> suspended, only the "power" vote is still held, so system suspend
> drops just that one. System resume then votes both domains back on,
> which keeps the votes balanced across the cycle.
> 
> The domains are attached with devm_pm_domain_attach_list() and
> PD_FLAG_NO_DEV_LINK, because runtime suspend and system suspend require
> different supplier states. Runtime suspend releases only the "bus"
> domain while retaining the "power" domain, whereas system suspend
> releases both domains. Ordinary device-links would couple both
> suppliers to the same consumer runtime PM state and therefore cannot
> express the required policy. The driver consequently manages the
> runtime PM references for the attached domains explicitly.
> 
> pm_runtime_put_sync() drops the domain usage count even when it
> returns an error, so failures to vote a domain off are only reported.
> Failing suspend on them would leave the driver thinking the votes are
> still held and unbalance the next resume/suspend pair.
> 
> Enable firmware-managed resource handling for the "qcom,sa8255p-dwc3"
> compatible while maintaining backward compatibility with existing
> platforms that use direct resource control.
> 
> The probe error path now disables the resources through the common
> helper, which also disables the interconnect paths. Clear the path
> handles when dwc3_qcom_interconnect_init() fails, so the unwind does not
> touch handles that were already released or never obtained.
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 244 +++++++++++++++++++++++++++++++----
>  1 file changed, 222 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 61a3e3c38f59..559de5172e61 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -13,6 +13,7 @@
>  #include <linux/kernel.h>
>  #include <linux/interconnect.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/phy/phy.h>
>  #include <linux/usb/of.h>
>  #include <linux/reset.h>
> @@ -70,6 +71,7 @@ struct dwc3_qcom_port {
>  
>  struct dwc3_qcom_priv_data {
>  	bool power_lost_in_suspend;
> +	bool fw_managed;
>  };
>  
>  struct dwc3_qcom {
> @@ -92,10 +94,26 @@ struct dwc3_qcom {
>  	enum usb_role		current_role;
>  
>  	bool			power_lost_in_suspend;
> +
> +	bool			fw_managed;
> +	struct dev_pm_domain_list *pd_list;
> +};
> +
> +/* Firmware-managed power domains, indexed in pd_list->pd_devs[] */
> +enum dwc3_qcom_pd {
> +	DWC3_QCOM_PD_POWER,
> +	DWC3_QCOM_PD_BUS,
> +	DWC3_QCOM_NUM_PD,
> +};
> +
> +static const char * const dwc3_qcom_pd_names[] = {
> +	[DWC3_QCOM_PD_POWER]	= "power",
> +	[DWC3_QCOM_PD_BUS]	= "bus",
>  };
>  
>  static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
>  	.power_lost_in_suspend	= true,
> +	.fw_managed		= true,
>  };
>  
>  #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -169,6 +187,164 @@ static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom)
>  	return ret;
>  }
>  
> +/*
> + * Firmware-managed resources
> + *
> + * Firmware owns the clocks, interconnects and GDSC and exposes them as two
> + * power domains:
> + * - DWC3_QCOM_PD_POWER ("power"): the GDSC supplying the controller
> + * - DWC3_QCOM_PD_BUS ("bus"): clocks and interconnects, which also need
> + *   "power" to be on for register accesses to succeed
> + *
> + * The domains are voted directly from the PM callbacks. The driver does not
> + * mirror the aggregate state, as the real state lives in firmware.
> + */
> +
> +/**
> + * dwc3_qcom_domain_attach() - Attach power domains
> + * @qcom: Pointer to the dwc3_qcom structure
> + *
> + * Attaches power domains for firmware managed resource handling. The
> + * domains are detached automatically when the driver is unbound.
> + * Returns 0 on success, negative error code on failure.
> + */
> +static int dwc3_qcom_domain_attach(struct dwc3_qcom *qcom)
> +{
> +	struct dev_pm_domain_attach_data pd_data = {
> +		/* Runtime and system suspend need different supplier states */
> +		.pd_flags	= PD_FLAG_NO_DEV_LINK,
> +		.pd_names	= dwc3_qcom_pd_names,
> +		.num_pd_names	= DWC3_QCOM_NUM_PD,
> +	};
> +	struct device *dev = qcom->dev;
> +	int ret;
> +
> +	ret = devm_pm_domain_attach_list(dev, &pd_data, &qcom->pd_list);
> +	if (ret != pd_data.num_pd_names) {
> +		dev_err(dev, "domain attach failed (%d)\n", ret);
> +		return ret < 0 ? ret : -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * dwc3_qcom_power_domain_put() - Vote the power domain off
> + * @qcom: Pointer to the dwc3_qcom structure
> + *
> + * pm_runtime_put_sync() drops the usage count even on error, so only warn.
> + * Failing the caller would make it think the vote is still held and
> + * unbalance the next get/put pair.
> + */
> +static void dwc3_qcom_power_domain_put(struct dwc3_qcom *qcom)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_put_sync(qcom->pd_list->pd_devs[DWC3_QCOM_PD_POWER]);
> +	if (ret < 0)
> +		dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
> +}
> +
> +/**
> + * dwc3_qcom_domains_get() - Vote the firmware-managed domains on
> + * @qcom: Pointer to the dwc3_qcom structure
> + * @bus_only: If true, leave the power domain untouched and only vote bus
> + *
> + * Each call must be paired with dwc3_qcom_domains_put() using the same
> + * @bus_only. Runtime PM usage counting keeps a domain on for as long as it
> + * is needed, regardless of the state firmware left it in.
> + * Returns 0 on success, negative error code on failure.
> + */
> +static int dwc3_qcom_domains_get(struct dwc3_qcom *qcom, bool bus_only)
> +{
> +	struct device *power_dev = qcom->pd_list->pd_devs[DWC3_QCOM_PD_POWER];
> +	struct device *bus_dev = qcom->pd_list->pd_devs[DWC3_QCOM_PD_BUS];
> +	int ret;
> +
> +	if (!bus_only) {
> +		ret = pm_runtime_resume_and_get(power_dev);
> +		if (ret) {
> +			dev_err(qcom->dev, "failed to enable power domain: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	ret = pm_runtime_resume_and_get(bus_dev);
> +	if (ret) {
> +		dev_err(qcom->dev, "failed to enable bus domain: %d\n", ret);
> +		if (!bus_only)
> +			pm_runtime_put_sync(power_dev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * dwc3_qcom_domains_put() - Vote the firmware-managed domains off
> + * @qcom: Pointer to the dwc3_qcom structure
> + * @bus_only: If true, leave the power domain untouched and only vote bus
> + *
> + * Bus is released before power, as bus accesses need power to be on.
> + */
> +static void dwc3_qcom_domains_put(struct dwc3_qcom *qcom, bool bus_only)
> +{
> +	int ret;
> +
> +	ret = pm_runtime_put_sync(qcom->pd_list->pd_devs[DWC3_QCOM_PD_BUS]);
> +	if (ret < 0)
> +		dev_warn(qcom->dev, "failed to disable bus domain: %d\n", ret);
> +
> +	if (!bus_only)
> +		dwc3_qcom_power_domain_put(qcom);
> +}
> +
> +/**
> + * dwc3_qcom_resources_enable() - Enable clocks and interconnect, or vote domains on
> + * @qcom: Pointer to the dwc3_qcom structure
> + * @bus_only: Firmware-managed only: leave the power domain untouched
> + *
> + * Returns 0 on success, negative error code on failure.
> + */
> +static int dwc3_qcom_resources_enable(struct dwc3_qcom *qcom, bool bus_only)
> +{
> +	int ret;
> +
> +	if (qcom->fw_managed)
> +		return dwc3_qcom_domains_get(qcom, bus_only);
> +
> +	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = dwc3_qcom_interconnect_enable(qcom);
> +	if (ret)
> +		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +/**
> + * dwc3_qcom_resources_disable() - Undo dwc3_qcom_resources_enable()
> + * @qcom: Pointer to the dwc3_qcom structure
> + * @bus_only: Firmware-managed only: leave the power domain untouched
> + */
> +static void dwc3_qcom_resources_disable(struct dwc3_qcom *qcom, bool bus_only)
> +{
> +	int ret;
> +
> +	if (qcom->fw_managed) {
> +		dwc3_qcom_domains_put(qcom, bus_only);
> +		return;
> +	}
> +
> +	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> +
> +	ret = dwc3_qcom_interconnect_disable(qcom);
> +	if (ret)
> +		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
> +}
> +
>  /**
>   * dwc3_qcom_interconnect_init() - Get interconnect path handles
>   * and set bandwidth.
> @@ -181,10 +357,16 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  	struct device *dev = qcom->dev;
>  	int ret;
>  
> +	/* Interconnects are managed by firmware */
> +	if (qcom->fw_managed)
> +		return 0;
> +
>  	qcom->icc_path_ddr = of_icc_get(dev, "usb-ddr");
>  	if (IS_ERR(qcom->icc_path_ddr)) {
> -		return dev_err_probe(dev, PTR_ERR(qcom->icc_path_ddr),
> -				     "failed to get usb-ddr path\n");
> +		ret = dev_err_probe(dev, PTR_ERR(qcom->icc_path_ddr),
> +				    "failed to get usb-ddr path\n");
> +		qcom->icc_path_ddr = NULL;
> +		return ret;
>  	}
>  
>  	qcom->icc_path_apps = of_icc_get(dev, "apps-usb");
> @@ -219,6 +401,9 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
>  	icc_put(qcom->icc_path_apps);
>  put_path_ddr:
>  	icc_put(qcom->icc_path_ddr);
> +	/* Leave no stale handles for the error unwind to disable */
> +	qcom->icc_path_ddr = NULL;
> +	qcom->icc_path_apps = NULL;
>  	return ret;
>  }
>  
> @@ -369,7 +554,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
>  	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
>  	u32 val;
> -	int i, ret;
> +	int i;
>  
>  	if (qcom->is_suspended) {
>  		/*
> @@ -379,6 +564,15 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  		 */
>  		if (dwc3_qcom_is_host(qcom) && !wakeup)
>  			dwc3_qcom_disable_interrupts(qcom);
> +
> +		/*
> +		 * Runtime suspend dropped only the bus domain. System suspend
> +		 * must drop the power domain too, so that system resume, which
> +		 * votes both domains back on, stays balanced.
> +		 */
> +		if (qcom->fw_managed && !PMSG_IS_AUTO(msg))
> +			dwc3_qcom_power_domain_put(qcom);
> +
>  		return 0;
>  	}
>  
> @@ -387,11 +581,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>  			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
>  	}
> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
> -	ret = dwc3_qcom_interconnect_disable(qcom);
> -	if (ret)
> -		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
> +	/* Runtime suspend keeps power voted on; system suspend drops both. */
> +	dwc3_qcom_resources_disable(qcom, PMSG_IS_AUTO(msg));
>  
>  	/*
>  	 * The role is stable during suspend as role switching is done from a
> @@ -442,13 +634,10 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  	if (dwc3_qcom_is_host(qcom) && wakeup)
>  		dwc3_qcom_disable_interrupts(qcom);
>  
> -	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = dwc3_qcom_interconnect_enable(qcom);
> +	/* Runtime resume re-votes bus only; system resume votes both. */
> +	ret = dwc3_qcom_resources_enable(qcom, PMSG_IS_AUTO(msg));
>  	if (ret)
> -		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
> +		return ret;
>  
>  	/* Clear existing events from PHY related to L2 in/out */
>  	for (i = 0; i < qcom->num_ports; i++) {
> @@ -696,8 +885,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	qcom->dev = &pdev->dev;
>  
>  	priv_data = of_device_get_match_data(dev);
> -	if (priv_data)
> +	if (priv_data) {
>  		qcom->power_lost_in_suspend = priv_data->power_lost_in_suspend;
> +		qcom->fw_managed = priv_data->fw_managed;
> +	}
>  
>  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>  	if (IS_ERR(qcom->resets)) {
> @@ -705,10 +896,16 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  				     "failed to get resets\n");
>  	}
>  
> -	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
> -	if (ret < 0)
> -		return dev_err_probe(dev, ret, "failed to get clocks\n");
> -	qcom->num_clocks = ret;
> +	if (!qcom->fw_managed) {
> +		ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "failed to get clocks\n");
> +		qcom->num_clocks = ret;
> +	} else {
> +		ret = dwc3_qcom_domain_attach(qcom);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = reset_control_assert(qcom->resets);
>  	if (ret) {
> @@ -724,9 +921,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
> -	if (ret < 0)
> +	/* Takes the votes whatever state firmware or the bootloader left */
> +	ret = dwc3_qcom_resources_enable(qcom, false);
> +	if (ret) {
> +		reset_control_assert(qcom->resets);
>  		return ret;
> +	}
>  
>  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!r) {
> @@ -805,7 +1005,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	dwc3_core_remove(&qcom->dwc);
>  clk_disable:
>  	reset_control_assert(qcom->resets);
> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> +	dwc3_qcom_resources_disable(qcom, false);
>  
>  	return ret;
>  }
> @@ -820,7 +1020,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>  
>  	dwc3_core_remove(&qcom->dwc);
>  	reset_control_assert(qcom->resets);
> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> +	dwc3_qcom_resources_disable(qcom, false);
>  	dwc3_qcom_interconnect_exit(qcom);
>  
>  	pm_runtime_put_noidle(qcom->dev);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
