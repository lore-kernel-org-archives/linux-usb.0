Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679059;
	b=X6rLYig1APzbzgtcVCeFFWIbDt1GQmVp1hkHdy/Yuzbv99iR+694d1Eewt4wh8W+fAGc
	 8dMCE85KfmIZuaBKHjE5K1OXSgq07DapfnsM31I6sxZb3z8wVp/fqYCHNUKZkFU2lqoKq
	 boEEBZLZPPOIk8FwcE9QDWXp1hM0DFOino4yz7qQTJq7Qc6xXUpmgwzafeuZ/CD0gsHGv
	 dCptB0JqBnrOhced9Mxvz4zKZR2ILB9KkU9b+WShUNy6eo7djjXpfCYP+tExxjRiX2j7D
	 QRGSeTsckxkSUIwQ8G88TjX/ppyeWOjbqr3egfBRfUwnhUYYexVF1gn9++ICahGEp9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
	b=2VU4Fbk2OOzoJXLnxZFJHDX6ff0xvjAyJBTJ7vFqzlma+m6OvasM+5bxADL/z6UhG8+3
	 Rxl2YICGR9y/ttw/aWjWW1V9ZY319EsskYiNIx0oKgajmCQV97Lu0AsPY0ZVgM2MEwIu9
	 oOwsDGTzfFxeAgc5X/vh0VNuo/tV8b+NGZ2Qr6F/kV77X39tuYELIJAo+n/BjTI4qrTgA
	 pUPdS+5Mxlhs5k+Fd6ol877FUJJqaQR9/Zx8UhI0dSFN2CDHAQcJfu6kTeYvGx3vxCAk7
	 +UUAH8ygGBcouRqJ5CunXF5TtUrlaHAof+58kyWunLKh/ZE7VlMTNkpjywumvncY0kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2I91NFM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpc+GDZN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62337606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62337606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2I91NFM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qpc+GDZN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4Ek2886570
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G7aKyVjdYavK2ZAELbW1cotg
	kHAtEELC6+iiVeRDFQ4=; b=D2I91NFMrsCgWpmcTIk+zto9ft+X0bo1UdjxwLH1
	86unbUWiUZ5NlhmZnvnO2pnnqWCwXjkU4pcsMw7ytJ6PoDmB5sUfY9b5WewhbZeV
	tJFU8Sa+fAVnp8gvjzUOcAR5g+fiOM7d+lDKMW4Af0LR28gVtthxVtjlLXw+1KeZ
	Qdl17zNAN8h0l7jqj/aSONnJ4k/j6lRwjqdfz0YF53AG8j21Yy9sYUalpwT3owCL
	/J24RdpPV2pgtPlPSeEGcRFWa5UVbQACVMYL1RL72zP6cAML0a19PP3+Mq/DRCi7
	7Q9ifxYYYtXqVDazBQjQe6RCzZPFT8HRDeKntrwpU5NkyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgayp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 07:44:18 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so6311847eec.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 23:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795679058; x=1796283858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
        b=Qpc+GDZNgG4nRVPTRMYQCDfZM3xgo0w9Z6KMAR5DlWA0unDniM/GuHb/CyhhljVfht
         0W/zWPmtJN15c/wi24UCmV1/uzz9VAIF/rOnNmsaZBoWBxHQaglSsWm01ieR53xh9P90
         47CRBdfb0dcerxCV5Mtc0IKTOTK9ecxVUCJTolUw6q036RqloBdf+3cj7lGmAEBYkIjt
         S4aVzTUHBJChXvDE9sLshZoi2XWhWg1xbz3zW6+rIlrnyLGeCrL+o+sUvJy5f8U89uwf
         0KXVCSgQsjirOFpTspa5ZtfsFRH8psZcPy5+PV3VMs8eWbZsyPfcMh9NuxTp+JAc73z/
         gRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679058; x=1796283858;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7aKyVjdYavK2ZAELbW1cotgkHAtEELC6+iiVeRDFQ4=;
        b=TUAt2ggzizeCR338kdtmNPV4iO/XENvwnii45MQBFBn41H0024n7VdC+m+kFg80/hz
         bbNjUSJgbGEwANb8bohonuWlgQ55YIqowoBdS1roBNdrHx3ehEX8roIC3pEdQTEcFhSU
         LNVnwknPPCkwp8+cYdYe/+3FOyRU/aVDGnrilABNi9vw/WvGXeeJjs9GLszNaVUkNdRx
         XHUEcqHk1TVi8jSD/gFqE0szJYub587iC/eA8ERt2PuzTNzG5CQUpJ3JEftN3+/q+Ooc
         OT2dxCh3hWRF7FysmIphfia4uCGWzCqAPlnfK5ZpCMvXA1QKoz6J+b/TZ74EpuWR7s84
         YWpA==
X-Forwarded-Encrypted: i=1; AL+hErFqw/LiUmx6EGUIz1yMxAahrMw76b9wXJZ+gVoNXozUyLN13jsPiRJ5q2KCFpCoS970rteWkAXULJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oyj0sS9dbOMmP7exxF7LAKkLVnqck8a1Iz6k4QJw6dPVEV1w9
	Nl0Udbt6KWEHCeV49evCiXZiDcqKq7lGSyLgX/biI5m9jJq1FvuWDDQAwZIlCjFy8rRGnnRilbP
	ILb4gKS/u+stQ3Iv29xjq3gCkuR/QzDpMSRzf9w44Fo/rQOdi55Pch9hF1y93l8o=
X-Gm-Gg: AZFdTZcIB9whYbpn089yCAMxuAX+EpUhXkD49/VCtrBboC9m7HoUFgtEfB593lJE9iT
	teGPzfpKFNdrHoNnPwqAE5JyHrJClWTFWVKY5K1onGIC3nVVA+xGI67zzN1kbw+8B77MQX/zJMW
	mnG9txAO+wIhrHTzm0LInqlRaxHgTmqEX0XYIHBkiS+NyrSj1BnQ944OPwE/XNP0EMVneY3mzvb
	ekGA3M6oFsEHHLbz37jUl5F7TvZdSAvMeef9WxhUUpVc4P0oeTzMZxhUagtm+fp6z1kACURIBDO
	gUw0z0uxyyz9/DDwajqAg5jZjixvACFz6ztimIYt5PUZzLFhv5ir2qZb9h9dQZm40V3yl1bbcbb
	Ez9JcP8b9VkLWrwEePxaCqJPtGZP5fz581n7UvHoiMZmGYuDE6FvZUKNcFerbBOKUd83KNlCeEd
	cc5RQAbtqZh0YuLobkZt3z+AY=
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id 5a478bee46e88-386565b529dmr16390654eec.36.1795679057779;
        Wed, 25 Nov 2026 23:44:17 -0800 (PST)
X-Received: by 2002:a05:7300:cf87:b0:386:565b:4f9b with SMTP id 5a478bee46e88-386565b529dmr16390634eec.36.1795679057224;
        Wed, 25 Nov 2026 23:44:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm64100626eec.14.2026.11.25.23.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:44:16 -0800 (PST)
Date: Wed, 25 Nov 2026 23:44:15 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 02/11] usb: dwc3: qcom: Disarm wakeup IRQs on system
 suspend without wakeup
Message-ID: <awfjT6DQ0beqlLUn@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX6PNWUQjnXDZz
 I986lUBX387kyaFKV3VhSQnbxmi4wuNTxumVh6lao1pfeSY1K13TBicx5ntPKXvW6ulSEve+I9b
 WOALtX9Ov2FJ3dGiu2omBhanqxZFTrUgPb2m9qTIL/XjABgcoi+kZ/F0W2alEpQ4H14wbYq1dFt
 XM/sHLcx2i+Oxc0JkI5nAy/6yTlzZmcJbAtKAoqsbaxFVmOyPHO9DkaKkyxP/N02tK+o2Df7q/b
 ZHffPv9Kb0/A96wY5yTpjBCCWwSRH9YA4jo+E25K6HTWZYJBdQlx03RX3Iiubb++y75XG74yOhR
 K7ClnXq05SgM4JOxnrRLjSfKXvuI2nFiiDLFWMR9taUt6JABYCIEsl+IAo/iJXYMw6zfpDmGCmX
 8PKqR5w18XkcgzwpR1dXHSEd8oMLznh/LJoX0lSe47Ye24iJ1robvumoI9skC+kw7TOHVrKS1oI
 tnjwuqdwQDY9oEGVZLA==
X-Proofpoint-GUID: 1eGr6SfoiObg0ZljZpt7rdu-NPw6gdg0
X-Proofpoint-ORIG-GUID: 1eGr6SfoiObg0ZljZpt7rdu-NPw6gdg0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX7sk5Xg99VV9V
 NJmbt/dgKV2H4hiYgpE60oT1v8hfB18v/YWlRo7XSBRnJRwjvEbUJhc7NGSOYO4XfoxuPyhHCqf
 +lsL4fc3J1RrhcJEPgfVgPWhCjNzZNI=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07e352 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BlGo1tluQEYad71Xd-AA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

On 26-11-23 16:17:17, Faisal Hassan wrote:
> Runtime suspend always arms the wakeup interrupts in host mode, even if
> the device is not wakeup capable. If the controller is still runtime
> suspended when system suspend runs without wakeup enabled, the
> interrupts stay armed as wakeup sources, so they can still wake the
> system. System resume does not disarm them either, as it only does so
> when wakeup is enabled, so they remain armed after resume and the next
> runtime suspend arms them a second time.
> 
> Disarm them in system suspend when the controller is already runtime
> suspended and wakeup is not enabled, so the state matches what a system
> suspend without a preceding runtime suspend would have left.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 7a7225b900b3..18db19cf2065 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -350,8 +350,16 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  	u32 val;
>  	int i, ret;
>  
> -	if (qcom->is_suspended)
> +	if (qcom->is_suspended) {
> +		/*
> +		 * Runtime suspend arms the wakeup interrupts in host mode
> +		 * regardless of the device wakeup setting. If system suspend
> +		 * runs without wakeup, disarm them here, as resume will not.
> +		 */
> +		if (dwc3_qcom_is_host(qcom) && !wakeup)
> +			dwc3_qcom_disable_interrupts(qcom);
>  		return 0;
> +	}
>  
>  	for (i = 0; i < qcom->num_ports; i++) {
>  		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
