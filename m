Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771981;
	b=5Re32mZVtwK5qSZCR7dIone+aTScZUsQNiy9I+nLBye+LtoxpSp9E0FnlPsGRgXJrF/U
	 fgwKTwcxC5CmMhLL3qnMA7CcsCO3FTPyhAl+a8M4W+LZ78WJjWazqa4Qs+COtZACNvFb4
	 x8hpIHbPzjemrrrFsc+1D7w0qM4tckkPBD+JlLaUT19e568r9jrSgcKIoHW4dklShEtVF
	 5qFFnw8OeLAABdKu+LMNfUIWSSivD2Ql2KW7NCCVZtP9w2wx0v1pMw9ShTggotN1Q4clw
	 ttj02prmD5jxZE/JoenJ7GoTC1/WLpknoKS6NB4SI9flNnIYTTsfWa+L7Rn83dHiuQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n/G5Nv2dAlUVtrGNDcGhMOQixY/8gCyKW3v0jjm00ms=;
	b=imCLFqyn3j/a/x7n+Uyu4iIsED+OFuq+CWJMmsCTcgkaoxbo+BobWRnQdGUvykzXxM/o
	 Nsz1gRKh1D7MnGdvJcKlMbqGFgtl31xZud96sMp4PneclPHbHduzpPLEKCrS3Nc6bXADA
	 zdtTDl7bL11P/hMTKnly1XR2IUhepjhzSuC9NLl8d2V3duoWGESdDeF9vUi6NKXdmgrni
	 FMD1L80ZMu2j07G8CY4hXLiPIjj+Bv6AGX3E+5oJh7Vy2Vzme/5hkF3IT4XX25NoYu1Xu
	 a49ExqtL2t1lFsiqLf8UPuLSa6VPiyI4GtTNLmUzUoSKpTQCQGDJuHpufYbtadiD32g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1GSPKmF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJALQzBX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58729606A32E
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 05:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58729606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1GSPKmF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YJALQzBX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RL0A222105
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 05:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n/G5Nv2dAlUVtrGNDcGhMOQixY/8gCyKW3v0jjm00ms=; b=d1GSPKmFAXNQ0KoN
	vK55XA3+Fl69MwK9bpfTrs7vaWiSrDRjn1qhPAlBAyiv2Q9oRGPnNRYi4kfuhnRd
	5K3iyevL67uJZZ6HoFtKEDMuiGUEyXo/EBWeJvJd2ju7zqHzH9wa7dkQD7fvimus
	x5pC/Hz42w59lwh3qVNR/4knR16lorwIhTqUIjbXEdJYTFpx/6AQP+Eh7QlGvBqZ
	pYhfVRORuJF3o9vBkVnv0/iFqzxQxwf4VrLns8m4RvcUKtq7AH/YvQNT0d7LLgUv
	2JJGBy6mQSgPWbnzK8gQYxKegVERb1GoBzCuCrB+32CxOI+JwprvEERiSCA1ta8Z
	kUiEaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubk0wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 05:59:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b09b223c70so200458a91.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 21:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793771978; x=1794376778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/G5Nv2dAlUVtrGNDcGhMOQixY/8gCyKW3v0jjm00ms=;
        b=YJALQzBXCh2yNwicKFAitCjRxTRC0Gx0Ar/cFXzMehLfm65NFVOKF7qQJHzoJP66I8
         nVUmyU3cuVWtURX+TN0nx9hT+fBJEJthNmryuMBNV608cTda17Rah5zV0pcVU9uNiivZ
         aNJyvLl2F4C9lEt0QgSvGORXnvh5v33ECHcEdmXvseOVdq5j76VTviB6sTB3zeHb8j3M
         tELT7V9B+UOND/ZAqCZc1LMhHavdm/rdfSF1K8qa1OUMWpG8Q2KMD4TihkagNjg68pu8
         N28zRUNKMLxdhy3lvEqEbnmrxDpiXQ8Cc7tbtQ4G+f55VcONIPppi3HpLp01ZkTKgK7v
         pylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771978; x=1794376778;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/G5Nv2dAlUVtrGNDcGhMOQixY/8gCyKW3v0jjm00ms=;
        b=L22Ow8wHFLy1Jhquh2CNt3wCTcJ5aUumFj4s0vSVKLXNBl6pfA26W7bpagj9c6m4lR
         zSIRSeN+votcG2RsFCFELIjqdfKf2UXILsoivF8AnKsEblPKA5KdCZpnI8wao3mMzFOs
         LbU7w6fLaCqN2DhS1w+y8HhvnIZiw0zaj39Khr7IL7qBfhv3X2vtXMuFMEdk3R3mYaxs
         zFeM2QEqtWQnLg0TYP+B6aiYBEuf399ScmUgWAIYrNcnpfKxSwGOLKABswaoxaw/hyo9
         EiH+lF9+K29h5gGzo8ZW4VLmP6H9nMlO+twGNZvjHhjfETczjZnx5sZMzIY2mrkwCyxN
         kouw==
X-Gm-Message-State: APuU4Z+uwqZ60zW/dIGdaPELuUWZ0KEPOK924JYNWdl4C48dw7fRRNjO
	QfEY/JwYpRrVxDD4Pqw+fbEuoQ9rHoYGFmQjUH4lzKXshm7hdbOLD5uGF0AHoH4PuZMoxC3Tuhb
	2IJHbDj4EtAOd1vObXEZKoKvw5m1o3eHs5rH4uSI6vkdhrp5TqEif7I73WWo1YiHOSRsvB/I=
X-Gm-Gg: AYBFou2cF1oSW6CVcFnQISxIWq0RqnioOce1PbnIqwq0cps4C6I0cdCdh2fU3j98iXJ
	BJyVaxsT3ih1tdKCxmTXqfH1xFZSeNBXTWhwCptOQSzm0T6MYEQLfuKgy9f4Z0wmw0LEMwdRY/x
	Wx2V2RlNFPsJfcvfjZfXgGVV16jPlvkA7W/H18MQGlmkWHWJx0tpueuslJfFW9zmtS5VybHVdOA
	WJOQaJKdYdEF0XAfxcngvPG6ScYc5j1GMI2c66uvCF/u3/iwUQ+RFNwOR9KMbZahbokZIZE9w2Z
	jHsWgC6mZV8aKjIQcu+kqLzryZ3EojwXlH/uNfuanWQdPoSzVw6mM+4IKEq0l0Jb832MIij2RUB
	0IKWF1xfgSSwzCJPhC1rQSTeFvrq6aI3gdKLA2DFNIBOw0f6XDF+vm4i8vRCXvKsyHwHAfEPX2V
	66
X-Received: by 2002:a17:90b:1643:b0:3b0:9fbf:894c with SMTP id 98e67ed59e1d1-3b09fbf8e31mr161210a91.17.1793771977735;
        Tue, 03 Nov 2026 21:59:37 -0800 (PST)
X-Received: by 2002:a17:90b:1643:b0:3b0:9fbf:894c with SMTP id 98e67ed59e1d1-3b09fbf8e31mr161203a91.17.1793771977134;
        Tue, 03 Nov 2026 21:59:37 -0800 (PST)
Received: from [10.216.40.83] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944bb7d0sm2197830a91.11.2026.11.03.21.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:59:36 -0800 (PST)
Message-ID: <501b80b1-6d65-4f37-8bf6-3846d9b7b028@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:29:27 +0530
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
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/7] usb: dwc3: qcom: Support firmware-managed resource
 states for power management
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <d04522f9f972637133b8b080919f870e56a66395.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <augrote-Sw3QO16d@hu-petche-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <augrote-Sw3QO16d@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfXxhBGbIlJU33D
 VZEowniJkGrGL5g0Q08rc2IT9nhl/thUqcOjwZSZXzEBzpsgHevq2RN+rz0rCg6aNBqFxc3lAA9
 Y7ZaqUfG4gon8S05rEB1QVyEzpSsbDQ=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aeac9cb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=RyKMRjjwCDUOkbTw7aYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: nLnYl_jzVTLw1cf1x1NcKw0t-AKZhg5Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX5G8yVHMPjyqM
 p/pxxfBabkYhL85LMMdToulIl+1mfa/31pk0NjsAX/ZTAG0bVplzpjV9MmnI2bPVHadnI6CWC66
 HzrPUIogol4RqaHdMzsB5jGv7posXo+oTVY0mFDkBaBB6q4orN4hH0K24zeIpvvbDG4kJ3LcwbZ
 0SACwbCAlUfZZmqL6T/iLp/eStxqzDptmu6pJljq5OzzNoclqHQhnImlyk2iToh/GpGikdMqvkf
 JrDfjm8N4c2Eo9VpmxEpohOarVdPTLO3Z0CB89I50BYt/oF7RCDcPh/cnniIEN369TQ4eBcxIzE
 VyjEAe09aCKhgA3naMBbDpK+rbd78fUqOM5fuiKd1/IPyJOq3VmSgO5FYoebcnIi4Og3qTcphlX
 gI+RtXwGSRmytE12RlZJaTaPRg+n7xLYHtnNFM7K6OIJQqx+Nn5DT8zjhor5qM7onmdRlLs3FR4
 c8KrRD/lKog+cRHY1Ww==
X-Proofpoint-ORIG-GUID: nLnYl_jzVTLw1cf1x1NcKw0t-AKZhg5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040023

On 02-11-2026 11:50 am, Peter Chen wrote:
> On 26-10-29 00:29:36, Faisal Hassan wrote:
>> Add support for firmware-managed resource handling in the Qualcomm
>> DWC3 USB controller driver. On platforms such as SA8255P, controller
>> resources are abstracted and managed collectively by firmware, and are
>> exposed to Linux through SCMI-backed power domains.
>>
>> On SA8255P, resources such as clocks, regulators, resets, TLMM and
>> interconnects are controlled by firmware. The driver communicates with
>> firmware through two power domains:
>>
>>    - "power": controls power supply (GDSC) to the USB controller
>>    - "bus": controls clocks and interconnects used for data transfer.
>>      Register accesses through the controller require the "power"
>>      domain to be enabled.
>>
>> The two domains are voted on and off directly from the PM callbacks
>> through dwc3_qcom_domains_get() and dwc3_qcom_domains_put(). Runtime
>> PM usage counting keeps each domain enabled for as long as it is
>> required; the driver does not attempt to track or infer any aggregate
>> device power state, nor does it assume what state firmware or the
>> bootloader left the domains in before probe.
>>
>> Runtime suspend/resume vote only the "bus" domain, since the "power"
>> domain must remain enabled for hardware accesses that can occur while
>> runtime suspended. System suspend/resume vote both domains.
>>
>> If system suspend is entered while the device is already runtime
>> suspended, only the "power" vote is still held, so system suspend
>> drops just that one. System resume then votes both domains back on,
>> which keeps the votes balanced across the cycle.
>>
>> The domains are attached with PD_FLAG_NO_DEV_LINK because runtime
>> suspend and system suspend require different supplier states. Runtime
>> suspend releases only the "bus" domain while retaining the "power"
>> domain, whereas system suspend releases both domains. Ordinary
>> device-links would couple both suppliers to the same consumer runtime
>> PM state and therefore cannot express the required policy. The driver
>> consequently manages the runtime PM references for the attached domains
>> explicitly.
>>
>> These votes are taken during probe, remove, suspend and resume,
>> enabling coordinated management of grouped resources according to the
>> controller's operational requirements.
>>
>> Enable firmware-managed resource handling for the
>> "qcom,sa8255p-dwc3" compatible while maintaining backward
>> compatibility with existing platforms that use direct resource
>> control.
>>
>> pm_runtime_put_sync() drops the domain usage count even when it
>> returns an error, so failures to vote a domain off are only reported.
>> Failing suspend on them would leave the driver thinking the votes are
>> still held and unbalance the next resume/suspend pair.
>>
>> While here, assert the controller reset in dwc3_qcom_remove() and on
>> the probe error-unwind path once the controller is powered down. These
>> paths are shared by every qcom,snps-dwc3 platform, not only the
>> firmware-managed ones added here. That is safe for existing platforms,
>> because remove() already fully powers the controller down and a probe
>> failure already leaves it unclocked.

Hi Peter,

Thanks for the review.
> 
> Since you do controller reset for all platforms, would you please split this
> patch for:
> 
> - Add controller reset for all qcom platforms
> - Add firmware-based resource management for auto SoCs
> 

Ok, I will move the reset on remove() and on the probe error path into 
its own patch, ahead of the firmware-managed one.

>>   
>> +/*
>> + * Firmware-managed resource handling
>> + *
>> + * On platforms where clocks, interconnects, resets and the GDSC for the USB
>> + * controller are owned and sequenced by firmware, access to those resources
>> + * is exposed to Linux as two power domains:
>> + * - pd_list->pd_devs[0] ("power"): the GDSC supplying the controller
>> + * - pd_list->pd_devs[1] ("bus"): the clocks and interconnects used for data
>> + *   transfer, which additionally require "power" to be on for register
>> + *   accesses to succeed
>> + *
>> + * The two domains are voted on/off directly from each PM callback that needs
>> + * them; there's no attempt to track or name an aggregate device power state,
>> + * since the actual state lives in firmware and is queried by voting through
>> + * runtime PM, not by mirroring it in the driver.
>> + */
>> +
>> +/**
>> + * dwc3_qcom_domain_detach() - Detach power domains
>> + * @qcom: Pointer to the dwc3_qcom structure
>> + *
>> + * Detaches all power domains.
>> + */
>> +static void dwc3_qcom_domain_detach(struct dwc3_qcom *qcom)
>> +{
>> +	if (qcom->pd_list)
>> +		dev_pm_domain_detach_list(qcom->pd_list);
>> +}
>> +
>> +/**
>> + * dwc3_qcom_domain_attach() - Attach power domains
>> + * @qcom: Pointer to the dwc3_qcom structure
>> + *
>> + * Attaches power domains for firmware managed resource handling.
>> + * Returns 0 on success, negative error code on failure.
>> + */
>> +static int dwc3_qcom_domain_attach(struct dwc3_qcom *qcom)
>> +{
>> +	struct dev_pm_domain_attach_data pd_data = {
>> +		.pd_flags	= PD_FLAG_NO_DEV_LINK,
>> +		.pd_names	= (const char*[]) { "power", "bus" },
>> +		.num_pd_names	= 2,
>> +	};
>> +	struct device *dev = qcom->dev;
>> +	int ret;
>> +
>> +	ret = dev_pm_domain_attach_list(dev, &pd_data, &qcom->pd_list);
> 
> Using devm_pm_domain_attach_list, the dwc3_qcom_domain_detach is not needed
> any more.
> 

Ok, I will switch to devm_pm_domain_attach_list() and drop 
dwc3_qcom_domain_detach().

>> +	if (ret != pd_data.num_pd_names) {
>> +		dev_err(dev, "domain attach failed (%d)\n", ret);
>> +		return ret < 0 ? ret : -ENODEV;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * dwc3_qcom_domains_get() - Vote the firmware-managed domains on
>> + * @qcom: Pointer to the dwc3_qcom structure
>> + * @bus_only: If true, leave the power domain untouched and only vote bus
>> + *
>> + * Votes runtime PM "on" for the domains this call is responsible for. Each
>> + * call has exactly one matching dwc3_qcom_domains_put() call with the same
>> + * @bus_only value on the corresponding disable path; runtime PM's own usage
>> + * counting is what keeps power on for as long as bus needs it, without the
>> + * driver tracking or assuming any prior domain state itself.
>> + * Returns 0 on success, negative error code on failure.
>> + */
>> +static int dwc3_qcom_domains_get(struct dwc3_qcom *qcom, bool bus_only)
>> +{
>> +	struct device *power_dev = qcom->pd_list->pd_devs[0];
>> +	struct device *bus_dev = qcom->pd_list->pd_devs[1];
>> +	int ret;
>> +
>> +	if (!bus_only) {
>> +		ret = pm_runtime_resume_and_get(power_dev);
>> +		if (ret) {
>> +			dev_err(qcom->dev, "failed to enable power domain: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = pm_runtime_resume_and_get(bus_dev);
>> +	if (ret) {
>> +		dev_err(qcom->dev, "failed to enable bus domain: %d\n", ret);
>> +		if (!bus_only)
>> +			pm_runtime_put_sync(power_dev);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * dwc3_qcom_domains_put() - Vote the firmware-managed domains off
>> + * @qcom: Pointer to the dwc3_qcom structure
>> + * @bus_only: If true, leave the power domain untouched and only vote bus
>> + *
>> + * Releases the votes taken by the matching dwc3_qcom_domains_get() call.
>> + * Bus is released before power since bus register accesses require power
>> + * to still be on.
>> + *
>> + * pm_runtime_put_sync() drops the usage count even when it returns an error,
>> + * so the votes are released regardless and errors are only reported. Treating
>> + * them as failures would make callers believe the votes are still held and
>> + * unbalance the next dwc3_qcom_domains_get()/put() pair.
>> + */
>> +static void dwc3_qcom_domains_put(struct dwc3_qcom *qcom, bool bus_only)
>> +{
>> +	struct device *power_dev = qcom->pd_list->pd_devs[0];
>> +	struct device *bus_dev = qcom->pd_list->pd_devs[1];
>> +	int ret;
>> +
>> +	ret = pm_runtime_put_sync(bus_dev);
>> +	if (ret < 0)
>> +		dev_warn(qcom->dev, "failed to disable bus domain: %d\n", ret);
>> +
>> +	if (bus_only)
>> +		return;
>> +
>> +	ret = pm_runtime_put_sync(power_dev);
>> +	if (ret < 0)
>> +		dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
>> +}
>> +
>>   static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>>   {
>>   	u32 reg;
>> @@ -380,8 +510,20 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>>   	int i, ret;
>>   	bool wakeup;
>>   
>> -	if (qcom->is_suspended)
>> +	if (qcom->is_suspended) {
>> +		/*
>> +		 * Runtime suspend dropped only the bus domain. System suspend
>> +		 * must drop the power domain too, so that system resume, which
>> +		 * votes both domains back on, stays balanced. The usage count
>> +		 * is dropped even if this fails, so don't fail the suspend.
>> +		 */
>> +		if (qcom->fw_managed && !PMSG_IS_AUTO(msg)) {
>> +			ret = pm_runtime_put_sync(qcom->pd_list->pd_devs[0]);
>> +			if (ret < 0)
>> +				dev_warn(qcom->dev, "failed to disable power domain: %d\n", ret);
>> +		}
>>   		return 0;
>> +	}
>>   
>>   	/*
>>   	 * For runtime suspend, always enable wakeup.
>> @@ -397,11 +539,17 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>>   		if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>>   			dev_err(qcom->dev, "port-%d HS-PHY not in L2\n", i + 1);
>>   	}
>> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>>   
>> -	ret = dwc3_qcom_interconnect_disable(qcom);
>> -	if (ret)
>> -		dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
>> +	if (!qcom->fw_managed) {
>> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> +
>> +		ret = dwc3_qcom_interconnect_disable(qcom);
>> +		if (ret)
>> +			dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
>> +	} else {
>> +		/* Runtime suspend keeps power voted on; system suspend drops both. */
>> +		dwc3_qcom_domains_put(qcom, PMSG_IS_AUTO(msg));
>> +	}
>>   
>>   	/*
>>   	 * The role is stable during suspend as role switching is done from a
>> @@ -456,13 +604,22 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>>   	 */
>>   	dwc3_qcom_disable_interrupts(qcom);
>>   
>> -	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (!qcom->fw_managed) {
>> +		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>> +		if (ret < 0)
>> +			return ret;
>>   
>> -	ret = dwc3_qcom_interconnect_enable(qcom);
>> -	if (ret)
>> -		dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
>> +		ret = dwc3_qcom_interconnect_enable(qcom);
>> +		if (ret)
>> +			dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
>> +	} else {
>> +		/* Runtime resume re-votes bus only; system resume votes both. */
>> +		ret = dwc3_qcom_domains_get(qcom, PMSG_IS_AUTO(msg));
>> +		if (ret) {
>> +			dev_err(qcom->dev, "failed to enable power domains: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>>   
>>   	/* Clear existing events from PHY related to L2 in/out */
>>   	for (i = 0; i < qcom->num_ports; i++) {
>> @@ -699,16 +856,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	if (priv_data)
>>   		qcom->broken_suspend = priv_data->broken_suspend;
>>   
>> +	if (priv_data && priv_data->fw_managed)
>> +		qcom->fw_managed = priv_data->fw_managed;
>> +
>>   	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>>   	if (IS_ERR(qcom->resets)) {
>>   		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
>>   				     "failed to get resets\n");
>>   	}
>>   
>> -	ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
>> -	if (ret < 0)
>> -		return dev_err_probe(dev, ret, "failed to get clocks\n");
>> -	qcom->num_clocks = ret;
>> +	if (!qcom->fw_managed) {
>> +		ret = devm_clk_bulk_get_all(&pdev->dev, &qcom->clks);
>> +		if (ret < 0)
>> +			return dev_err_probe(dev, ret, "failed to get clocks\n");
>> +		qcom->num_clocks = ret;
>> +	}
>>   
>>   	ret = reset_control_assert(qcom->resets);
>>   	if (ret) {
>> @@ -724,9 +886,33 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   		return ret;
>>   	}
>>   
>> -	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (!qcom->fw_managed) {
>> +		ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>> +		if (ret < 0) {
>> +			reset_control_assert(qcom->resets);
>> +			return ret;
>> +		}
>> +	} else {
>> +		ret = dwc3_qcom_domain_attach(qcom);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to attach domains (%d).\n", ret);
>> +			reset_control_assert(qcom->resets);
>> +			return ret;
>> +		}
>> +
>> +		/*
>> +		 * pm_runtime_resume_and_get() is correct here regardless of
>> +		 * whatever state firmware or the bootloader left the domains
>> +		 * in beforehand.
>> +		 */
>> +		ret = dwc3_qcom_domains_get(qcom, false /* bus_only */);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to enable power domains (%d)\n", ret);
>> +			dwc3_qcom_domain_detach(qcom);
>> +			reset_control_assert(qcom->resets);
>> +			return ret;
>> +		}
>> +	}
>>   
>>   	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>   	if (!r) {
>> @@ -790,9 +976,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   		goto clk_disable;
>>   	}
>>   
>> -	ret = dwc3_qcom_interconnect_init(qcom);
>> -	if (ret)
>> -		goto remove_core;
>> +	if (!qcom->fw_managed) {
>> +		ret = dwc3_qcom_interconnect_init(qcom);
>> +		if (ret)
>> +			goto remove_core;
>> +	}
>>   
>>   	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>>   	device_init_wakeup(&pdev->dev, wakeup_source);
>> @@ -804,7 +992,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   remove_core:
>>   	dwc3_core_remove(&qcom->dwc);
>>   clk_disable:
>> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> +	if (!qcom->fw_managed) {
>> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> +	} else {
>> +		dwc3_qcom_domains_put(qcom, false /* bus_only */);
>> +		dwc3_qcom_domain_detach(qcom);
>> +	}
>> +
>> +	reset_control_assert(qcom->resets);
>>   
>>   	return ret;
>>   }
>> @@ -817,9 +1012,18 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>>   	if (pm_runtime_resume_and_get(qcom->dev) < 0)
>>   		return;
>>   
>> +	/* Also disables runtime PM and marks the device suspended. */
>>   	dwc3_core_remove(&qcom->dwc);
>> -	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> -	dwc3_qcom_interconnect_exit(qcom);
>> +
>> +	if (!qcom->fw_managed) {
>> +		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>> +		dwc3_qcom_interconnect_exit(qcom);
>> +	} else {
>> +		dwc3_qcom_domains_put(qcom, false /* bus_only */);
>> +		dwc3_qcom_domain_detach(qcom);
>> +	}
>> +
>> +	reset_control_assert(qcom->resets);
>>   
>>   	pm_runtime_put_noidle(qcom->dev);
>>   }
> 
> There are so many judgements for qcom->fw_managed during the main flow, since
> there are only resource management difference, is it possible hide the differences
> for the main flow, and add some qcom USB resource APIs for them, eg:
> 
> static void dwc3_qcom_clk_disable(struct dwc3_qcom *qcom, bool bus_only)
> {
> 	if (!qcom->fw_managed)
> 		clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
> 	else
> 		dwc3_qcom_domains_put(qcom, is_all);
> }
> 
> For calling dwc3_qcom_interconnect_init(qcom), if it is fw_managed, just boil out.
> 

Ok, I will add resource enable/disable helpers that wrap either the 
clocks and interconnect or the power domain votes, so the suspend, 
resume, probe and remove paths no longer check fw_managed. 
dwc3_qcom_interconnect_init() will return early on firmware-managed 
platforms, as you suggest.

Thanks,
Faisal

