Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB424192F5
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 14:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744529; cv=none; b=VSCuhSe+n7YACATQJHNaEDEnZ9Mhd2wBQQAcY4I9bg22gvSO6SkSYFGk4bTMkuLbq8hzLiBDUrjElCIPdSoX2OA2xXfFik3UWRIkPLYNUkVjvzcH49Gk6V6AqZcZwg66tr3Uc/hd3x4kz79ZdjtpN4+0hJJIqpWPMeHHosgHd4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744529; c=relaxed/simple;
	bh=Cs3QIOvflvCrcjeDTiLoWqYrAKt3UNUaD/sCKGjx5v0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nFK5y4A5QPXGaYePGXZjjZgTJ4UUkJFmatEatsf6E/v6fIn3pOq5ZLNXhV2zmxMstdkLV/GrxXbrLIgem/KxdyTzZ4useTr60x3+cLl54d5kLUsam1SHEvFSeAaEYA6aecaC4IOqeuNrdFGdoXBYu3+v9VGIUjz5JUz3YfcUv7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8uKzxwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOSyxHxD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8uKzxwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOSyxHxD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASwYc2641470
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 14:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYQHKrNAuY55Xo4YAYBwK1+PtQbR+3tl/cQx6YHt1j8=; b=Q8uKzxwAGrj09eX3
	D+NNartPaUyAzBh5IHVLtFMjezGieFgm4Verrsr/aMCI6Y6+2pcf8wno4/4DMoXC
	mD+nmnJZ1OMiV2XKq89idAsYnHBQy3D1oj4/OcIojM4o6od3J9HE7V1tiSFYRQvs
	PcVpwGspfgoOHaVUpwTPLHsoBQmw5aQcT61ggtU2K9xS99hUBl+8YOU48Q9T6IBl
	D25ppjDmYO2N++SwQVYk/UZYGKz3bl+ZU2I75Hpt3ZAmNrBVFFlUuVAguC5rBsoy
	qw9DVI/v5M7OV6dKmCMMKX5E5Zh3Ib7yK9MhRMzD2GEYkLACbu7SE3WQbAcI7CXw
	5s3UbA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3npescm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 14:48:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30ca3374c6aso9303806eec.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782744525; x=1783349325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYQHKrNAuY55Xo4YAYBwK1+PtQbR+3tl/cQx6YHt1j8=;
        b=kOSyxHxDABkl78wUs0Ws9TqMam47NR4rj8bqJ/vS8Jr7nhpsZbYGbjaCH7ST82UGh4
         +pSzte/cdcTrZmq+AxoFPzEJzc0nDS7gRAPeyxI93z7WLEIjeht7geA7WyrVvYAnRLR9
         1zADNL/ZHZKAS6RQt/LZ9649uXkWUilwKFKMrOu70OrMb2TO/C4nY9i1z4JxOLvnWfES
         rCG6SxYnEMuGYYoYYaUCcSYeK1D3Z63ZAW+2acAtDRjcrsdpCG/PsQXcFzTVl+4aU0kC
         bGQbEQlANGtCJS3aJ5BJQTpoj+Rng0ocSqP0WS9C/nXLriOxOuyQ1nsSMQYeANgS+osh
         QKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744525; x=1783349325;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYQHKrNAuY55Xo4YAYBwK1+PtQbR+3tl/cQx6YHt1j8=;
        b=GmYyebCYlXEIMaEUygjJF10HeDncM4Yi9Qp/pwUwa+1L+N4sjKKABGfzIJmnWhH0HB
         gaDSLTro7/IkJDao0mO0x82AjhOlR2v8KM3BqOaBg7rTwssBHUQVZWLDl6Blh/2Pe6hV
         9SCHyW1yUJ+2McM0HAHnvmMWi3I+XWmvczdt9EA+zJ31aaVzYPpMkN3d7AE9v/FohFgr
         dVQRsnmygL1k1xtsXMvB4y+cL4VmvIOhdPub8IRuRF4lRqUa5aCxPSBTD3l9EEhfNrbR
         WMJMHjOW021MES9ys0PGNRx9uBI27OPQeDgKvwK8xVY9s5/AHPZNyj1yEKG1+qIEFgR1
         xiFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3jvLVVOoFKs9JEO0tvZ8HXbX/7JvMnQVrjVUOvjcZxZW4GhoYV7UbivBuu6D6suotDj4kfjh0iNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5LsRVnFwWmwtevj2W5jdDK+wAIbggJRGj6DeawZPDjwnKt7/N
	IKzwpB1Q05R9voxmnt9YwOCQkVfdx3EQze1cBPjiRB8ju24iR4Gx8WNNN+LltAN1h4dNUO/fB+p
	iKcmu23wEH9VKUxuHa3XoNJP90+v378sm7ZkfXiBQj65npopyaU/Qj+JAXB/dxfM=
X-Gm-Gg: AfdE7cn6D0uWBD6QexLd50EpVf8S6/ZgKdUv3ZcCWpqXyHCqO0JvccsKXb+/vHylBKn
	Cy5ONmYi1IIe+bR7EKucYVwD5TCvWx9vX+tXDr0asb/COi97ldTeUtjHkRoEdByXpZUZUOoIUci
	fo/Z+Yr8W48yWD8dxhqzGMf1F0aIKAHF8rCQGV4f51GOx3LkcQXB1s/KuaImYf0Ph7DJ7N4cbdp
	ICh+eH10jAlNtare3Ce72tPf90n3lKEJ1jcBITzQJgLLyD2g24BLM+cu1P7QI8t8damB+Wp4xA6
	JkWf6iYfgpYaquuzor+SP1F8q29ppr7RP3Wn+KArrPolgbfjjY/GmH/atxE/FN6xkpK4xJvY20U
	Ru3jgdE3EOu8XKE9cdWFRoD2F9uQ+xrZhxwo/HWbma0Wdt6Tzn4dYjBa6VmVZW6P4/jSh0WUmy4
	7fqhE=
X-Received: by 2002:a05:7300:2316:b0:30e:952b:ddf4 with SMTP id 5a478bee46e88-30edd1ae37emr686694eec.3.1782744525292;
        Mon, 29 Jun 2026 07:48:45 -0700 (PDT)
X-Received: by 2002:a05:7300:2316:b0:30e:952b:ddf4 with SMTP id 5a478bee46e88-30edd1ae37emr686667eec.3.1782744524668;
        Mon, 29 Jun 2026 07:48:44 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:853f:f554:7d46:88f4? ([2603:8001:7f00:fc12:853f:f554:7d46:88f4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1ae5sm54673511eec.16.2026.06.29.07.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:48:44 -0700 (PDT)
Message-ID: <35348aa8-f878-4ee7-bb96-a1d9203bca4f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 07:48:42 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Improve Qualcomm EUD driver and platform support
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXzFeAbPEMwemN
 sLNko6hw5S1bOos3wgef2IU6jmsQ3Q2CMv8cSdHaqojK63gS67DVrI3tBrbbXIEshfijuoricet
 OhxwuSEYIuL8SLKt+XFPUO5lkanFzTbS4x8n63+S4B3YvUYwVYlx/2gGBk1uaAUwGxIaxSEAal9
 WrTOLXWuGFghPt473E6Wdih+NzXx9SVObHT/ltNC/hP1D0h5tbb1Z8ZLBfnO32Z/T+3nlQad3Am
 7tng0CDVVCRdoBNuqpd9y8s5gOgP4FtO6TC7Bc8BeBggge8dV4zLLxd52MPtLLiN7xOpkWPW5Od
 ilNtVkfKiV8tmCrL5qOn3/P/tv0MKgmIGj/biWtz11lDT7zp4vGzZYSfQYWJn1eN04aZTsHEqlW
 msnoVNalpeZ9NP59d2RJq+/Zqe+/HzRKfcGqjloOhlZZHVec+kuvc6Bi4RUzzqUDLJZn8a9NWyc
 vfjUdGubhXfGbaQAliQ==
X-Proofpoint-ORIG-GUID: 6rxwMD4dVTABaCki5zQ-1sH2ZVBvDHvs
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a4285ce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=oEN8I4j559GpTlrCs2sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEyMyBTYWx0ZWRfXz6sUJgr4dbN3
 Cj/N3YNaRYRImFqfxWctUnTz1k6c06yYaZrNUqx9/4H8O9aqowPNKG0H7JzuuOiRv87xzjTX3An
 YStmsxRHOAE+hgHxsC1ymUysZMh2P6M=
X-Proofpoint-GUID: 6rxwMD4dVTABaCki5zQ-1sH2ZVBvDHvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290123



On 5/1/2026 10:06 AM, Elson Serrao wrote:
> Note: This v4 revision introduces a design change compared to v3.
> Based on discussion and feedback, the binding adopts a child-node-based
> model while preserving the legacy top-level 'ports' property. The
> child-node approach is required because EUD needs a separate OF graph
> per UTMI path to accurately describe per-path role switching.
> 
> Link to the discussion leading to this decision:
> https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> 


Hi Dmitry,

Just following up on this series.

Could you please take a look at the updated design and share
your feedback? Does it align with what we discussed earlier:
https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/

Please let me know if any further changes are needed.

Thanks,
Elson


> ---
> 
> The Embedded USB Debugger (EUD) is a High-Speed USB on-chip hub that
> provides debug and trace capabilities on Qualcomm platforms. The current
> EUD driver, however, lacks essential hardware resources such as PHY
> references and support for multi-port configurations. This series
> addresses those gaps and introduces the necessary device tree updates
> to enable testing and validation of the enhanced functionality.
> 
> Below is a high-level block diagram showing the EUD and its connections.
> 
> 
> 			              EUD Block
>  	                   +------------------------------+  
> 			   |                              |
> [Conn-0]-->[USB2PHY-0]---->|-------- Path 0 --------------|-->[USBCtrl-0]
> 			   |                              |  
> [Conn-1]-->[USB2PHY-1]---->|-------- Path 1 --------------|-->[USBCtrl-1]
> 			   |                              |
> 			   |      +------------------+    |
> 			   |      |  EUD Debug Hub   |    |
> 			   |      +------------------+    |
> 			   +------------------------------+
> 
> This work builds upon an earlier EUD driver submission:
> https://lore.kernel.org/all/20240730222439.3469-1-quic_eserrao@quicinc.com/
> and extends it with support for multi-port use cases and proper handling
> of EUD operation across different USB roles.
> 
> The series has been validated on the Qualcomm Dragonwing Q6 platform
> (RB3 Gen2 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> ---
> Changes in v4:
> - [Patch 0001] Restructure the flattened ports representation to a child-node
>   based model.
>   - Preserve the top-level 'ports' property and add per-path child nodes,
>     so that each role-switch path is described using its own OF graph.
>     (Dmitry).
>   - Link to the discussion leading to this design decision:
>     https://lore.kernel.org/all/20260324172916.804229-1-elson.serrao@oss.qualcomm.com/
> - [Patch 0002] Use explicit port names when selecting the active EUD
>   port (Greg)
> - [Patch 0003] Use a scoped iterator when looping over child nodes and
>   drop redundant EUD path validation checks (Konrad). Preserve support
>   for the legacy top-level ports description.
> - [Patch 0004] Register role switch per path and forward the role switch
>   notifications to the USB controller.
> - [Patch 0006]  Add host mode co-ordination based on the role changes as
>   per the new design and drop the custom API that was used to get role
>   notifications.
> - [Patch 0008] Described the UTMI path as a child node with role switch
>   capability.
> - Link to v3: https://lore.kernel.org/all/20260309203337.803986-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in RFC v3:
> - Replaced the per-path (eud-path@N) model with a flattened ports
>   representation based on the feedback.
> - Added port@2 and port@3 to support dual-port configurations.
> - Removed the EUD-local 'phys' and 'usb-role-switch' properties since PHY
>   and role-switch information is obtained from walking the OF graph.
> - Updated PHY discovery logic by fetching the PHY from the controller
>   node/fwnode, and exported a new API for the controller to report role
>   changes. The dwc3-qcom driver now uses this API to notify EUD on role
>   transitions.
> - Updated the DTS structure by moving the EUD-to-controller port mapping
>   into the base SoC DTSI, enabling EUD by default, and adjusting all board
>   DTS files accordingly, including adding the usb-role-switch provider
>   link on connector nodes.
> - Link to v2: https://lore.kernel.org/all/20260126233830.2193816-1-elson.serrao@oss.qualcomm.com/
> 
> Changes in v2:
> - Improved commit message of patch 0001 and 0003 with historical context
>   on why EUD worked without PHY references on single-path systems.
>   Expanded the usb-role-switch property description in the bindings file.
> - Link to v1: https://lore.kernel.org/all/20260116232106.2234978-1-elson.serrao@oss.qualcomm.com/
> ---
> 
> Elson Serrao (9):
>   dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
>   usb: misc: qcom_eud: add sysfs attribute for port selection
>   usb: misc: qcom_eud: add per-path High-Speed PHY control
>   usb: misc: qcom_eud: add per-path role switch support
>   usb: misc: qcom_eud: improve enable_store API
>   usb: misc: qcom_eud: add host mode coordination
>   usb: misc: qcom_eud: fix virtual attach/detach event handling
>   arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
>   arm64: dts: qcom: Map USB connector to EUD on Kodiak boards
> 
>  Documentation/ABI/testing/sysfs-driver-eud    |  16 +
>  .../bindings/soc/qcom/qcom,eud.yaml           |  55 ++-
>  arch/arm64/boot/dts/qcom/kodiak.dtsi          |  35 +-
>  .../boot/dts/qcom/qcm6490-fairphone-fp5.dts   |  10 +-
>  .../dts/qcom/qcm6490-particle-tachyon.dts     |  10 +-
>  .../boot/dts/qcom/qcm6490-shift-otter.dts     |  10 +-
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  10 +-
>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  10 +-
>  .../boot/dts/qcom/sm7325-nothing-spacewar.dts |  10 +-
>  drivers/usb/misc/qcom_eud.c                   | 346 ++++++++++++++++--
>  10 files changed, 446 insertions(+), 66 deletions(-)
> 
