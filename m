Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA66485CE3
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635502; cv=none; b=EsJXOP65tuFOvUnadIDktrahXEueUgZSh94GJ+DzxJT/0ux3GByA5VVEHtKP2lVyYoHbiu61B+xYA15voWAaImjzWIW9HsBskcboelkbg13LjJcY3j3r8NokNjDALqKJVu6w5YUg1ZmoPzqoms3n3E1kFfqJGtErJNqdVbH5I08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635502; c=relaxed/simple;
	bh=+UccSeJlO0loZSK/eH8DMP1/5s7t4faZKMDsRTcReC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a14nLZFvXrMV8AC/PaLaeIJ86O3KjOnilm2tu533/tntlIU+W9eWaxNn0a+uZ0xDvY5UOwFnUw4IInCNYdODtnvLHVY9owuxip+agQ0YR4JOuH+5pZYSkaI3SbigbBm5cw3/oR3jF6Mum//daYzQEdINTtl8zm7ghAxoprPjPrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+aYcNPp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvB0nQtV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+aYcNPp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvB0nQtV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTdT23706324
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 15:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Z+8TPPRz/0BEaS0dGmL/mci
	2zflTsU1Bc4aBxXGWSE=; b=g+aYcNPpxIWs/oJJ0iCejJakXeLzxdBdRG12jvMh
	argp1tvJHacVB5XZz3z5BLhlTizXR2vhaqycVmwEPP9Waogv4QuVA5csDPJpPLYx
	PIafcPe5N0WFyCLqROGpo1/NZ6MCmI3LJ03mxcxvj3lox5vOQXdBvnQcTTBPM8Bl
	a+FZoL+NsdoH3gxuv/uhMGCG+82Zo7nJs5nInVwTTrJ94rP6fkAZ/021CMu0l5Pz
	MJ9GHQvRTMsKCdamXCqkZ/fmqYYYDrvQfRlcnr2EVPR+MrDWm897sCQa1ULNI1AI
	8fCtJtkbmXoGOSmT9M4QnxQFFTgvbV30H4/t4KKv1vdOag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5jew2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 15:38:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so667161cf.2
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 08:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786635492; x=1787240292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Z+8TPPRz/0BEaS0dGmL/mci2zflTsU1Bc4aBxXGWSE=;
        b=KvB0nQtVg4pO9gyXeYStZgsL8bGgNaaz3saz3woGS/RezwCthOfrdw+sU1HHEb+KLn
         9iLVl+K35aFVk1YTSM5o4MpxsZ2PIS29Cx6BfMN26N0B9auYJ3qEzFqBs7tKJIcTOQTv
         xds76EfzjBFMONPCLgN+DJat/e35tgTGj8peD0SC/P9SGvxWsxpzYufDwbGQgtwkG3AC
         o3h4WZ9Lf36Nabm5E6JzpZE+L8HxbHi47Yc5d6rObBa4mbBO1jHi2UFnX6lzqki1IKgQ
         MEBmFY+UXVQu2VZQRuuAxGI/f5DPqDLX4JXduweMVtCu7DJ5l8oIhtYea9PlY7LzjN4/
         SY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635492; x=1787240292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Z+8TPPRz/0BEaS0dGmL/mci2zflTsU1Bc4aBxXGWSE=;
        b=EJUFdiltbkW96YCtzgjDd6Msq4nbcqGmVnTxRzPKOFEy/Wo+3A7gLgZEQbp4iJvxdv
         d3/a/Eg8I06flBGNSv4Mlz0CbRRr/dhPGbfDmSUikvbsmBRzx27kWJa6HDhO8cE/9dpA
         aHuAI5zqoLQWvpnVZ2lPoIqih4K+nqezXnShZVLu2UCRomPSiORN+yZEwCQerxDy5w9b
         +NlFUwUYoqSIFGg9BgtK8i0BHLRPfVnt07XgORoK7amvN9FQDt2cSURaL7dte0XnjsTB
         XZe3H3VwTHIHS+XbLU7O2SZyJOZhKwUyISeJfAJ269xiCTO5owR/bnoCAezPu7kIp/Pt
         4biA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2TMoa0fgsejLJQJX/pE70/3tAh6378Ulnmcx3h7cNOHS4+VYdR9RsgLLcN276mbT1uNQrFCJt0tM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiLdr07U2Ofc0f9iOTogR31jEPZ5IolXSOX32Qq5MVHDk8cvp2
	pX5hsHOgHFIipaDzOR9oANwT+Vz4porOjfIRXJh2vnyI4G4hFTjMN/FM9eD54GS30C1u7xAJHLI
	2xKJDybiYpEXkf4vmZl6nHnSSvbBvArITCJwPXFjIQz3LcEbIXLouptBtac7T2y8=
X-Gm-Gg: AR+sD11bUgbwQ3wmkHUveTqtaGvQxi5foha9cJ87PswOwyY5MHvlDmMA28B0RlXA8IF
	PqarYkWpfYbHVfdcRVQqPVh3JDX4auAs/B2LEaQQ8YHb7AQ1zSUG7IRLgH+WHx9Zv+1YqPt8CZc
	vWYh4oEmwEPJIXH56LdVbYigjJXPxFF6TMLd/m6hc/xlFqdKUFa7Ee5zPMz/X+IM0rfu3WzNRTL
	Ug05CDYkWfQwkVZpmHAWYTf0+7jC8cev9TeqymKhZh7qfyCvAHI15Uc1eHID18IZLU+CaArCcVh
	j3cNjxdRkJezdt+sM9gKwtRAV18F+eXnWHF5Amj7M4MfcciemV+Zgh8T1Bu+6ERSGu1NZlhPc+2
	EoyRwYcS8ZkvAhkPbN14TidTJA99J4ibqHiHHcq7qavqdOf82YwJSfxYmlbWg+8G4bCP/euc++v
	fOrmA5H71u8gZP
X-Received: by 2002:a05:622a:1106:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52d73be0ed5mr63315471cf.4.1786635492126;
        Thu, 13 Aug 2026 08:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1106:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52d73be0ed5mr63314781cf.4.1786635491629;
        Thu, 13 Aug 2026 08:38:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458419613sm64708e87.62.2026.08.13.08.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:38:10 -0700 (PDT)
Date: Thu, 13 Aug 2026 18:38:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 08/14] arm64: dts: qcom: ipq5332: Add clocks required
 for USB3 support
Message-ID: <5dh3s4dbpynj3tbe5ivmsq5qjnjztmzpmbj2m5whmi43qlae5a@w6flmrikrked>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfXyr6EaaH1STPU
 gEGCIfIP77s4I1STEUPmL5qyLZ00DLx3sbyDnveDIGRVVF+UPd08LEJcMTUO0IMGYykN3AOpXID
 05g2MmgR6RQk0V0h6MPN6v2gIZiCpno=
X-Proofpoint-GUID: rVj5To1yRI68fvhhokPxY-B6rLVQOsur
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfX8GWLuUYgIiez
 K3e79YtOG0msU82rj/b++GOU7rfmeZdV6mnKRSv/PeIb0r2LUkgmHAuFLwe+iyHe87X/dcPfaz7
 aS2SbZWOoJhymJSTveGeNxmA+cYl3f00bn/xL06qE7nPqhR1axtGxNQ5EOBFxxJ+F1O+FtsM646
 dSjmL68hWItcfsWEiNrcfZEwW0jEcFaCw221EdFHMGYWWkAKIeMLCbF0QWY6UcgUtuomiAxtPkU
 bVFlBARELiTXTJXid/HfCFoQpq94I10JrHrzYT0HpYBdZ2mugOxIRYXJ6/shiyPhTogQZzSF4Hb
 Som15Roq8+aw5NyzM22ce2CJiIoPr49doqF1BtwDnmHdTlSuLp10dsKppmztSg0zm2XUDmDGeug
 2iNo42A7TVwVZOJh1+fIUhLXsQ7MmL3dguEjUbnl5k0rhOsdTMwM9wQ+9l0B6gU108mhzG/exrh
 2kZKz1O/GaFCvhifBJA==
X-Proofpoint-ORIG-GUID: rVj5To1yRI68fvhhokPxY-B6rLVQOsur
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7de4e5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=TbTMhDWFNTfgXYAo_YsA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130112

On Wed, Aug 12, 2026 at 01:34:43PM +0400, George Moussalem wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
