Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714329;
	b=KcVsRZFkC5aV8EhqmoKMyaRr1mjip8ZJEDQgWZg8S4RJozsJmQ8ozz7a5po15Zj5oISu
	 9ZL3S2Sonn9Qo0gnhXwgKuc+wXh0t3mTZmdUFYRAudfnwu3faHXpRQsqWhFbDyxKle4Af
	 fyslGEaGPkwR3Qq5946Jg1n6YYj9HG9Tf+Jg58fnR5f3+vnEdsK2yIo3kTpczuGvxZxjI
	 26HIK7MTnUL/r6/G8EKdYz8N+/PUxQQWNGN5/ZkkcyfYrB83CiTJcQcWs3MW3qLilIzld
	 P12EFSVCd72CsY8ZKq6t1Azf5Fyve9E03TrAw6rZKRrRla1BXkpKgpGdggTtIgnal2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
	b=iZtgcP0Tv8ty3JKGMV+AW3L/pZL9hLbvKb+VmJ40u8InN3ma35XLDGNdZL/aqAREBrBM
	 5WUfKVZx6y+76lMdoTU1wh5Ja11M0VY+14qwoHta9XrwBFIxJJRVXbEp0+lEoEirOScD/
	 J3N0GyMB5aHfOH4SBt5NqoAOdu2BLYFfQMIdxhV/xHT0JjRoRQxcnBGiFPGCjpZosCra5
	 nqCgtCqhZUmz3M/71XrCuFQuG//S9HHgrdp9WXH3tzliv7tvXf/VFVSQHppS0Ya/l2ti9
	 BBt9BBOKDF6tuyuzWhlRMJCpkNAL/QeM8fluDv6IthYeGN0Te0e8mNQlpGnwlUyYueQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHGHk5DX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nje3F+ca;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEEB606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHGHk5DX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nje3F+ca
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFtq5t2834940
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=; b=aHGHk5DXdGm+xSDp
	t9TtYweyTDwg7nx+aw8ZFt/A4TBw9qeDCgg+Rk1EhOv9JC7WmZcHw3uq7TzB8mJ1
	ySLjoKw0s8ibVxnjV0bumOY700ksROzumX2dHR3cpsSUiE4Ch8cdI6f7JoI235XT
	b+5UtH+1SX2LIgkSMAp0tSDr+R7ZoxwuqArXrfd5gse8yfQX7bSHGuTSPHQzzw+F
	yW+Klx6DzA/g8vB5ubtG4OAtK/1cL56WROPjCuRzMYk7eEnyViM4Pzp48ro7efxr
	E+T4MT7EK8lLFLnCKG8yp45V4/2ZLyXupCkWuRhPo62UdBiTwY/DU/h2elj6x2BP
	f5SPqA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqgmnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 17:32:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so5682415a12.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714327; x=1796319127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
        b=Nje3F+cacqnvCTzctixs8NCEWVijYbfMviH/izKO/RFLP/w6t0jppyy1IkPx5V+W2Q
         BGI8lI4L5Me/gxuewA2OxJI7Ey1w4OLOFlPqnagnPRjy2zXZa7Z+2omKkc+dGLO+HAiI
         GW1heMbKXC6X8lNSw92j05BAn9/yHuUEeFs+zwLujtuWCWleiiOkMHP0HicKSKWtB9lc
         8Rcd8foAhed1jYwThxYGRd3xRHsuHHmYZhq1a4WoroyPXWKbqE0YHQdjaLs+sciXz9qM
         EVCDReeT3EiuIMVUT0o4lxbjfvbEGETXt2q7x+Xf4Xbv/O//NeOxPPpvYdzy90Nt2Usj
         dk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714327; x=1796319127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
        b=BOgNu4JKwlQryZ+nCAIu6CBN9uKRtOkYuoFTHzUfPXefo6WzB67n9a0H0RZ4lDl7Th
         0tHlF6Q/gXrogUg0dIajioQWhk4VCoqsRavLfinwo+AeLIRxkXTkvqilqbUUGPcYY3We
         3e8mC3Dr7tGXQG9i9OFXZ7QMYGZetXTDnqpxo3vgcx7krYLbpxHCDR+jE2nm5gdTdqbI
         +P7n5jlHZZVkm373zSjgJSsoTRjQ0dPO6aX72szDNcGs05acXP+Hl8JsCBfqMDO+W5x2
         5r+VPrNVIrVO/3UfogquIYXIvNvKhp9/SSQJnsFmfYEFE3RGVm8c5VH6WNxHa3dPcf/Y
         tgoA==
X-Gm-Message-State: APuU4Z/dW6lsdbskhtI8jsuhce8H0/SkhPIFcBq5dkkhZlR8gm120a/N
	qQfR7jDskFRx1AbHStzywg1hKQC47P1mDP65IOeMsCfyUb8MBX4UhRXZ1tj/jcirk0NlhBjwtEf
	hGkPNFDlTXRXocdfUzGTyt322owmLvOJIGXaL/4Rw856u5yPIT78sZopNMNG/Z30=
X-Gm-Gg: AZFdTZcGN/I0+CMONm9YrgW0PYpfc7f9a2FOoa1VCp7gTvZwOuCTpQXwHsb5akHJZnq
	cGCDfiLvISYO2x0YsyAGOEDWAVL2u8W2M+80FYyHchyAE6oMFzAD1u7Tmf9pTGpl5eW+ghVB2Dd
	kevNmwE1vcLO9rv1C3ag2L8or2f1DD8brl2z7ai5eZdw01x0c/J12PugglF4IqK2un9lYc4eE4r
	ePoFkzSEhSqJ00rAL0zbjYPgwHYzO1y0bUbaWGMZLd27o+4XH/UIStE0Kd/VGcse2Qkri1fi0UD
	L8qMGynEnR4LM+AExLIXIvW+QkilX4JDfV9mU0GzhvLo2JzY00iLlzs3LtIXwNr/ADV0M+fyCIF
	1NoFlWyDHAMXWJp8GguB4f6cmu1yC0kOk4AK5tWaSo8MZw1iiL2Mp4Lt4BZmk+LCXZIcfiL4MB9
	Sf/MDeab8Wb5pT2AJWPn1h2fbpuUgVmMT+zpszdgkD
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr24967836637.48.1795714326884;
        Thu, 26 Nov 2026 09:32:06 -0800 (PST)
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr24967805637.48.1795714326388;
        Thu, 26 Nov 2026 09:32:06 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm7776293b3a.25.2026.11.26.09.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:32:05 -0800 (PST)
Message-ID: <3c1b3957-3ce6-4109-8465-246d87e408f9@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:01:59 +0530
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
Subject: Re: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GrwXIWrFqgtwXZ6551tqAeMnqWI1XvCN
X-Proofpoint-ORIG-GUID: GrwXIWrFqgtwXZ6551tqAeMnqWI1XvCN
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b086d17 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zjTcfuHnCzxvNZJ2CccA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX8Z2o3ujYnWQU
 IG2XabmEYJ2T3WK6oyQm2Sq7dykbCZGHqtGsXYK21JjDb8VRBRvkNiKUyJw9uwUeHYiQjiJBS3T
 Ikis2bj6O/l+5YTIU+SsqVandXLCtwo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX5vMCPEFENWY2
 koZJoVrx+zkNLjzIvtpFUrLX5ihMmfkIzSBrk+r6KW5Lw9CF+zrwKjuJQYakaI1Min9EGyA2pOs
 30d/7GYZ3JLu63XMWSfkVKutO8AHYiBQrTt+5P7lUycGM797zEh2BRD8xP1WwMvMfCs/x06cqTl
 9oVLJdhTr2HQKXMT7JhAACF/3uyfx3Kvc6XpdXoWU66kBhvzG52l+ZdrOllMEiVyuoslDMLopgd
 nfR1emaID9iIOpeVWKPNX7ZZN2HxDqcZ8HdAxA6kakk34CLYXfhOgIqZ+o18DT4tEOBHHwQvtqk
 oBF7wKnBMW3N3yD7gj4dCWL3z7U2cro9DsYBdXqPS8g7aiHTyfxHvJEeswi2nFMULojP6QjYGBV
 Bnovs3w8T2UXMZKW3+aL3zOAodhFlOup10lx6CXUPbWHNYiVcCwg24sFrJlgy4g3dTZQ7Byz6tV
 NQZP0+sILZ12R9ZfJdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> clocks. If clk_bulk_prepare_enable() fails, it returns with them
> disabled. The next suspend returns early on is_suspended without
> re-enabling them, and the next resume disables them again, so every
> failed resume leaves the disable depth one level deeper and host-mode
> wakeup is lost for good.
> 
> Re-enabling them on the error path is not safe either: the
> level-triggered ss_phy interrupt can stay asserted, and the handler
> can't make progress while the controller is not resumed, so it would
> fire continuously.
> 
> Track whether the wakeup interrupts are armed and make enabling and
> disabling them idempotent. A failed resume now leaves them disarmed and
> balanced, and the next suspend arms them again.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 18db19cf2065..e7fadad9a4e1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>   	enum usb_dr_mode	mode;
>   	bool			is_suspended;
>   	bool			pm_suspended;
> +	bool			wakeup_irqs_armed;
>   	struct icc_path		*icc_path_ddr;
>   	struct icc_path		*icc_path_apps;
>   
> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>   {
>   	int i;
>   
> +	if (!qcom->wakeup_irqs_armed)
> +		return;
> +
>   	for (i = 0; i < qcom->num_ports; i++)
>   		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = false;
>   }
>   
>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>   {
>   	int i;
>   
> +	if (qcom->wakeup_irqs_armed)
> +		return;
> +
>   	for (i = 0; i < qcom->num_ports; i++)
>   		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = true;
>   }
>   
>   /*
> @@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   	if (!qcom->is_suspended)
>   		return 0;
>   
> +	/*
> +	 * If a later step fails, the wakeup interrupts stay disarmed, as a
> +	 * level-triggered wakeup line could otherwise keep firing while the
> +	 * controller can't be resumed.
> +	 */
>   	if (dwc3_qcom_is_host(qcom) && wakeup)
>   		dwc3_qcom_disable_interrupts(qcom);
>   

